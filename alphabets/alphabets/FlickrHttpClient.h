//
//  FlickrHttpClient.h
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "AFHTTPClient.h"

@interface FlickrHttpClient : AFHTTPClient<NSCoding, NSCopying>
+ (FlickrHttpClient *)instance;

- (void)findPhotosForTerm: (NSString*)term success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
