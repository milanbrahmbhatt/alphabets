//
//  AlphabetsViewController.m
//  alphabets
//
//  Created by Milan Brahmbhatt on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "AlphabetModel.h"
#import "AlphabetsViewController.h"
#import "LetterSelectorCell.h"
#import "LetterViewController.h"
#import "DictionaryTableViewController.h"

@interface AlphabetsViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *lettersCollectionView;
@property (strong, nonatomic) AlphabetModel *model;

- (void)editDictionary;
@end

const int NUM_SECTIONS = 1;

@implementation AlphabetsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Alphabets";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.model = [[AlphabetModel alloc] init];
    
    self.lettersCollectionView.delegate = self;
    self.lettersCollectionView.dataSource = self;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                    style:UIBarButtonItemStylePlain target:self action:@selector(editDictionary)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return NUM_SECTIONS;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([self.model.alphabetList count] == 0) {
        return 0;
    }
    
    return [self.model.alphabetList count]/NUM_SECTIONS;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UILabel *letterLabel = (UILabel *)[cell viewWithTag:100];
    NSString *letter =[self.model.alphabetList objectAtIndex:indexPath.item];
    letterLabel.text = letter;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowLetter"]) {
        LetterSelectorCell* selectorCell = (LetterSelectorCell*)sender;
        NSString *letter = selectorCell.letterLabel.text;
        LetterViewController *letterViewController = segue.destinationViewController;
        letterViewController.currentLetter = letter;
    }
}

- (void)editDictionary
{
    DictionaryTableViewController* editViewController = [[DictionaryTableViewController alloc] init];
    
    [self.navigationController pushViewController:editViewController animated:YES];
}

@end
