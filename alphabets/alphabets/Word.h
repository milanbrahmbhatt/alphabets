//
//  Word.h
//  alphabets
//
//  Created by Mark Kim on 10/23/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property (nonatomic, strong) NSString *word;
@property (nonatomic, strong) NSString *firstLetter;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *imageUrl;

- (id)initWithWordLetter:(NSString *)word firstLetter:(NSString *)letter;

@end
