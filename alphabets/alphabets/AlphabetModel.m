//
//  AlphabetModel.m
//  alphabets
//
//  Created by Kevin Lee on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "AlphabetModel.h"

@interface AlphabetModel ()
@end

@implementation AlphabetModel

- (id) init {
    self = [super init];
    if (self != nil) {
        self.alphabetList = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I",
                         @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z",nil];
    }
    
    return self;
}

@end
