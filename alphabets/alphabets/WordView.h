//
//  WordView.h
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface WordView : UIView
@property (strong, nonatomic) IBOutlet WordView *view;
@property (weak, nonatomic) Word *word;
@end
