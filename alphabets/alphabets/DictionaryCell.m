//
//  DictionaryCell.m
//  alphabets
//
//  Created by Mark Kim on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "DictionaryCell.h"

@implementation DictionaryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
