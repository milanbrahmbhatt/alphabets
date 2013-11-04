//
//  Dictionary.h
//  alphabets
//
//  Created by Mark Kim on 10/23/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface Dictionary : NSObject

@property (nonatomic, strong) NSMutableArray *dictionary;

- (BOOL) addWordForLetter:(Word *)word letter:(NSString *)letter;
- (NSArray *) wordArrayForIndex:(int)index;
- (NSArray *) wordArrayForLetter:(NSString *)letter;
- (NSString *) letterFromInt:(int) index;
- (int) intFromLetter: (NSString *) letter;
- (Word *) randomWordForLetter:(NSString *)letter;
- (Word *) randomWordForIntegerIndex:(int)index;
- (NSMutableArray *) defaultDictionary;

@end
