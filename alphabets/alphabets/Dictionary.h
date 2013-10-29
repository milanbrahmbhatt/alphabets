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

@property (nonatomic, strong) NSMutableArray *wordList;

- (BOOL) addWordForLetterToDictionary:(Word *)word letter:(NSString *)letter;
- (NSArray *) wordListForLetter:(NSString *)letter;
   
@end
