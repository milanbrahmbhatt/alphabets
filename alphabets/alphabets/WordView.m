//
//  WordView.m
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "WordView.h"

@interface WordView ()
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *wordImage;

@end

@implementation WordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:@"WordView" owner:self options:nil];
        [self addSubview:self.view];
    }
    return self;
}

- (void)setWord:(Word *)word
{
    self.wordLabel.text = word.word;
    [self.wordImage setImage:word.image];
}

@end
