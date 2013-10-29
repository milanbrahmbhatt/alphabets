//
//  DictionaryCell.h
//  alphabets
//
//  Created by Mark Kim on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DictionaryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *wordImage;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;

@end
