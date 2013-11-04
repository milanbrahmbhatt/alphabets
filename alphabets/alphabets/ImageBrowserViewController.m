//
//  ImageBrowserViewController.m
//  alphabets
//
//  Created by Kevin Lee on 11/3/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "ImageBrowserViewController.h"
#import "FlickrHttpClient.h"
#import "ImageBrowserCell.h"

@interface ImageBrowserViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;

@property (strong, nonatomic) NSMutableArray *photoUrls;

- (void)onError;
@end

const int NUM_IMAGE_SECTIONS = 1;

@implementation ImageBrowserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.imageCollectionView.delegate = self;
    self.imageCollectionView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return NUM_IMAGE_SECTIONS;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([self.photoUrls count] == 0) {
        return 0;
    }
    
    return [self.photoUrls count]/NUM_IMAGE_SECTIONS;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    ImageBrowserCell *cell = (ImageBrowserCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.url = [self.photoUrls objectAtIndex:indexPath.item];
    
    cell.imageCellDelegate = self;
    
    return cell;
}

- (void)selectCell:(ImageBrowserCell *)cell
{
    NSString* imageUrl = cell.url;
    
    [self.imageBrowserDelegate updateImageWithUrl:imageUrl];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onError {
    [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"An error occurred while trying to access Flickr, please try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)findImagesForWord:(NSString *)word
{
    [[FlickrHttpClient instance] findPhotosForTerm:word success:^(AFHTTPRequestOperation *operation, id response) {
        self.photoUrls = [NSMutableArray array];
        for (NSDictionary *photoData in [response valueForKeyPath:@"photos.photo"]) {
            NSString *url = [photoData valueForKey:@"url_q"];
            if (url != nil) {
                [self.photoUrls addObject:url];
            }
        }
        
        [self.imageCollectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self onError];
    }];
}

@end
