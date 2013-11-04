//
//  ImageBrowserCell.h
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageBrowserCell;

@protocol ImageBrowserCellDelegate <NSObject>
- (void)selectCell:(ImageBrowserCell *)cell;
@end

@interface ImageBrowserCell : UICollectionViewCell
@property (nonatomic, weak) id <ImageBrowserCellDelegate> imageCellDelegate;

@property (weak, nonatomic) NSString *url;

@end
