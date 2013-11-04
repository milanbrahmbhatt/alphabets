//
//  WordEditViewController.h
//  alphabets
//
//  Created by Mark Kim on 10/24/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"
#import "ImageBrowserViewController.h"

@interface WordEditViewController : UIViewController<ImageBrowserViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *wordImage;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) Word *word;

- (void) initWithWord:(Word *)word;



@end
