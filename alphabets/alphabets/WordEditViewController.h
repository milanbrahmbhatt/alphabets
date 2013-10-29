//
//  WordEditViewController.h
//  alphabets
//
//  Created by Mark Kim on 10/24/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *wordImage;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;

@end
