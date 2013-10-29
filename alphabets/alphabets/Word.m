//
//  Word.m
//  alphabets
//
//  Created by Mark Kim on 10/23/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "Word.h"

@implementation Word

-(Word *)initWithWordLetter:(NSString *)word firstLetter:(NSString *)letter
{
    self.word = word;
    self.firstLetter = letter;
    
    // Go to flickr and get image urls. 
    
    return self;
}

@end
