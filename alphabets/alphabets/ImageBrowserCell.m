//
//  ImageBrowserCell.m
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "ImageBrowserCell.h"
#import "UIImageView+AFNetworking.h"

@interface ImageBrowserCell ()
@property (weak, nonatomic) UIImageView *image;

- (void)onButtonClick: (id)sender;
@end

@implementation ImageBrowserCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
    }
    return self;    
}

- (void)awakeFromNib
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    [button setUserInteractionEnabled:YES];
}

- (void)onButtonClick:(id)sender
{
    [self.imageCellDelegate selectCell:self];
}

- (void)didMoveToSuperview
{
    self.image = (UIImageView*)[self viewWithTag:100];
    
    NSURL *urlObject = [NSURL URLWithString:self.url];
    [self.image setImageWithURL:urlObject];
}
@end
