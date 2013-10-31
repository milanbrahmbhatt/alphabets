//
//  Dictionary.m
//  alphabets
//
//  Created by Mark Kim on 10/23/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "Dictionary.h"
#import "Word.h"


@implementation Dictionary

- (void) initDictionary
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.dictionary forKey:@"MyDictionary"];
    
    if (self.dictionary == nil) {
        self.dictionary = [self defaultDictionary];
    }
}

- (BOOL) addWordForLetter:(Word *)word letter:(NSString *)letter
{
    return YES;
}

- (NSArray *) wordArrayForIndex:(int)index
{
    return self.dictionary[index];
}

- (NSArray *) wordArrayForLetter:(NSString *)letter
{
    return self.dictionary[[self intFromLetter:letter]];
}

- (NSString *) letterFromInt:(int) index
{
    if (index >= 0 && index < 26) {
        return [NSString stringWithFormat:@"%c", (char)(index + 65)];
    }
    
    return @"A";
}

- (int) intFromLetter: (NSString *) letter
{
    int letterAsInt = (int) [letter characterAtIndex:0];
    
    if (letterAsInt >= 65 && letterAsInt < 91) {
        return letterAsInt - 65;
    }
    
    return 0;
}

- (Word *) randomWordForLetter:(NSString *)letter
{
    return [self randomWordForIntegerIndex:[self intFromLetter:letter]];
}

- (Word *) randomWordForIntegerIndex:(int)index
{
    NSMutableArray *wordsForIndex = self.dictionary[index];
    
    if ([wordsForIndex count] == 0) {
        return nil;
    }
    
    return [wordsForIndex objectAtIndex: arc4random() % [wordsForIndex count]];
}

- (NSMutableArray *) defaultDictionary
{
    NSMutableArray *defaultDictionary = [[NSMutableArray alloc] initWithCapacity:26];
    for (int i=0; i < 26; i++) {
        NSMutableArray *words = [[NSMutableArray alloc] init];
        defaultDictionary[i] = words;
    }
    
    NSMutableArray *wordsForLetter = nil;
    wordsForLetter = defaultDictionary[0];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Apple" letter:@"A" image:[UIImage imageNamed:@"apple.jpg"]]];
    wordsForLetter = defaultDictionary[1];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Bat" letter:@"B" image:[UIImage imageNamed:@"bat.jpg"]]];
    wordsForLetter = defaultDictionary[2];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Cat" letter:@"C" image:[UIImage imageNamed:@"cat.jpg"]]];
    wordsForLetter = defaultDictionary[3];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Dog" letter:@"D" image:[UIImage imageNamed:@"dog.jpg"]]];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Deer" letter:@"D" image:[UIImage imageNamed:@"deer.jpg"]]];
    wordsForLetter = defaultDictionary[4];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Elephant" letter:@"E" image:[UIImage imageNamed:@"elephant.jpg"]]];
    wordsForLetter = defaultDictionary[5];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Frog" letter:@"F" image:[UIImage imageNamed:@"frog.jpg"]]];
    wordsForLetter = defaultDictionary[6];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Grass" letter:@"G" image:[UIImage imageNamed:@"grass.jpg"]]];
    wordsForLetter = defaultDictionary[7];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Helicopter" letter:@"H" image:[UIImage imageNamed:@"helicopter.jpg"]]];
    wordsForLetter = defaultDictionary[8];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Igloo" letter:@"I" image:[UIImage imageNamed:@"igloo.jpg"]]];
    wordsForLetter = defaultDictionary[9];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Juice" letter:@"J" image:[UIImage imageNamed:@"juice.jpg"]]];
    wordsForLetter = defaultDictionary[10];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Kangaroo" letter:@"K" image:[UIImage imageNamed:@"kangaroo.jpg"]]];
    wordsForLetter = defaultDictionary[11];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Lion" letter:@"L" image:[UIImage imageNamed:@"lion.jpg"]]];
    wordsForLetter = defaultDictionary[12];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Monkey" letter:@"M" image:[UIImage imageNamed:@"monkey.jpg"]]];
    wordsForLetter = defaultDictionary[13];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Nest" letter:@"N" image:[UIImage imageNamed:@"nest.jpg"]]];
    wordsForLetter = defaultDictionary[14];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Owl" letter:@"O" image:[UIImage imageNamed:@"owl.jpg"]]];
    wordsForLetter = defaultDictionary[15];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Pen" letter:@"P" image:[UIImage imageNamed:@"pen.jpg"]]];
    wordsForLetter = defaultDictionary[16];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Queen" letter:@"Q" image:[UIImage imageNamed:@"queen.jpg"]]];
    wordsForLetter = defaultDictionary[17];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Rock" letter:@"R" image:[UIImage imageNamed:@"rock.jpg"]]];
    wordsForLetter = defaultDictionary[18];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Snake" letter:@"S" image:[UIImage imageNamed:@"snake.jpg"]]];
    wordsForLetter = defaultDictionary[19];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Tie" letter:@"T" image:[UIImage imageNamed:@"tie.jpg"]]];
    wordsForLetter = defaultDictionary[20];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Umbrella" letter:@"U" image:[UIImage imageNamed:@"umbrella.jpg"]]];
    wordsForLetter = defaultDictionary[21];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Vine" letter:@"V" image:[UIImage imageNamed:@"vine.jpg"]]];
    wordsForLetter = defaultDictionary[22];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Watch" letter:@"W" image:[UIImage imageNamed:@"watch.jpg"]]];
    wordsForLetter = defaultDictionary[23];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Xylophone" letter:@"X" image:[UIImage imageNamed:@"xylophone.jpg"]]];
    wordsForLetter = defaultDictionary[24];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Yak" letter:@"Y" image:[UIImage imageNamed:@"yak.jpg"]]];
    wordsForLetter = defaultDictionary[25];
    [wordsForLetter addObject:[[Word alloc] initWithString:@"Zebra" letter:@"Z" image:[UIImage imageNamed:@"zebra.jpg"]]];
    
    return defaultDictionary;
}

@end
