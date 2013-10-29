//
//  LetterViewController.h
//  alphabets
//
//  Created by Milan Brahmbhatt on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface LetterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *letterLabel;
@property (weak, nonatomic) IBOutlet UIImageView *letterImage;
@property (weak, nonatomic) IBOutlet UILabel *word;
- (IBAction)onDictionaryTap:(id)sender;
@property (strong, nonatomic) Word *dataObject;
@end
