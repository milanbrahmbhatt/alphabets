//
//  ImageBrowserViewController.h
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageBrowserCell.h"

@protocol ImageBrowserViewControllerDelegate <NSObject>
- (void)updateImageWithUrl: (NSString *)url;
@end

@interface ImageBrowserViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, ImageBrowserCellDelegate>
@property (nonatomic, weak) id <ImageBrowserViewControllerDelegate> imageBrowserDelegate;

- (void) findImagesForWord: (NSString*)word;
@end
