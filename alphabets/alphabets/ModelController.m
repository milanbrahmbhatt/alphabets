//
//  ModelController.m
//  alphabets
//
//  Created by Milan Brahmbhatt on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "ModelController.h"
#import "LetterViewController.h"
#import "Word.h"

@interface ModelController()

@end

@implementation ModelController

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        
        // Sample data
        Word *word1 = [[Word alloc] initWithWordLetter:@"Ant" firstLetter:@"A"];
        Word *word2 = [[Word alloc] initWithWordLetter:@"Bat" firstLetter:@"B"];
        Word *word3 = [[Word alloc] initWithWordLetter:@"Cameleon" firstLetter:@"C"];
        Word *word4 = [[Word alloc] initWithWordLetter:@"Dog" firstLetter:@"D"];
        Word *word5 = [[Word alloc] initWithWordLetter:@"Elephant" firstLetter:@"E"];
        Word *word6 = [[Word alloc] initWithWordLetter:@"Frog" firstLetter:@"F"];
        Word *word7 = [[Word alloc] initWithWordLetter:@"Giraffe" firstLetter:@"G"];
        Word *word8 = [[Word alloc] initWithWordLetter:@"Hyena" firstLetter:@"H"];
        Word *word9 = [[Word alloc] initWithWordLetter:@"Zynga" firstLetter:@"Z"];
        
        _pageData = @[word1, word2, word3, word4, word5, word6, word7, word8, word9];
    }
    return self;
}

- (LetterViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    LetterViewController *letterViewController = [storyboard instantiateViewControllerWithIdentifier:@"LetterViewController"];
    //TODO randomize words?
    letterViewController.dataObject = self.pageData[index];
    return letterViewController;
}

- (NSUInteger)indexOfViewController:(LetterViewController *)viewController
{
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(LetterViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(LetterViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}
@end
