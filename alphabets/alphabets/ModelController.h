//
//  ModelController.h
//  alphabets
//
//  Created by Milan Brahmbhatt on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LetterViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>
@property (readonly, strong, nonatomic) NSArray *pageData;
- (LetterViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(LetterViewController *)viewController;

@end
