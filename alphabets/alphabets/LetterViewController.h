//
//  LetterViewController.h
//  alphabets
//
//  Created by Milan Brahmbhatt on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LetterViewController : UIViewController<UIScrollViewDelegate, UIPageViewControllerDelegate>
@property (weak, nonatomic) NSString *currentLetter;
@end
