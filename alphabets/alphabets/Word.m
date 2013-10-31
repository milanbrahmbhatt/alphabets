//
//  Word.m
//  alphabets
//
//  Created by Mark Kim on 10/23/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "Word.h"

@implementation Word

- (id)initWithString:(NSString *)word letter:(NSString *)letter
{
    self.word = word;
    self.firstLetter = letter;
    return self;
}

- (id)initWithString:(NSString *)word letter:(NSString *)letter image:(UIImage *)image
{
    self.word = word;
    self.firstLetter = letter;
    self.image = image;
    return self;
}

@end
