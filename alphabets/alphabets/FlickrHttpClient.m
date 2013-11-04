//
//  FlickrHttpClient.m
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "FlickrHTTPClient.h"
#import "AFNetworking.h"
#import "NSString+MD5.h"

#define FLICKR_BASE_URL [NSURL URLWithString:@"http://api.flickr.com/services/"]
#define FLICKR_CONSUMER_KEY @"21157742931751e63b89a566b70de057"
#define FLICKR_CONSUMER_SECRET @"39074765444ee952"

@implementation FlickrHttpClient
+ (FlickrHttpClient *)instance {
    static dispatch_once_t once;
    static FlickrHttpClient *instance;
    
    dispatch_once(&once, ^{
        instance = [[FlickrHttpClient alloc] initWithBaseURL:FLICKR_BASE_URL key:FLICKR_CONSUMER_KEY secret:FLICKR_CONSUMER_SECRET];
    });
    
    return instance;
}

- (id)initWithBaseURL:(NSURL *)url key:(NSString *)key secret:(NSString *)secret {
    self = [super initWithBaseURL:url];
    if (self != nil) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    return self;
}

- (void)findPhotosForTerm: (NSString*)term success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"flickr.photos.search" forKey:@"method"];
    [params setValue:FLICKR_CONSUMER_KEY forKey:@"api_key"];
    [params setValue:term forKey:@"text"];
    [params setValue:@"url_q" forKey:@"extras"];
    [params setValue:@"json" forKey:@"format"];
    [params setValue:@"1" forKey:@"nojsoncallback"];
    
    NSMutableArray *paramList = [NSMutableArray array];
    for (NSString* key in params) {
        id value = [params objectForKey:key];
        [paramList addObject:
         [NSString stringWithFormat:@"%@=%@",key,(NSString*)value]
         ];
    }
    
    NSString *paramString = [paramList componentsJoinedByString:@"&"];
    
    NSString *path = [NSString stringWithFormat:@"rest/?%@&api_sig=%@", paramString, [self getSignatureForParams:params]];
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    [self getPath:path parameters:nil success:success failure:failure];
}

- (NSString*)getSignatureForParams: (NSDictionary *)params
{
    if (params == nil) {
        return nil;
    }
    
    NSArray *keys = [params allKeys];
    NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *string1 = (NSString*)obj1;
        NSString *string2 = (NSString*)obj2;
        
        return [string1 compare:string2];
    }];
    
    NSMutableArray *sortedParams = [NSMutableArray array];
    for(id key in sortedKeys) {
        [sortedParams addObject:key];
        [sortedParams addObject:[params objectForKey:key]];
    }
    NSString *paramString = [sortedParams componentsJoinedByString:@""];
    
    return [[FLICKR_CONSUMER_SECRET stringByAppendingString:paramString] MD5String];
}

@end
