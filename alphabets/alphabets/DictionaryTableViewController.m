//
//  DictionaryTableViewController.m
//  alphabets
//
//  Created by Mark Kim on 10/24/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "DictionaryTableViewController.h"
#import "WordEditViewController.h"
#import "DictionaryCell.h"

@interface DictionaryTableViewController ()

@end

@implementation DictionaryTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *customNib = [UINib nibWithNibName:@"DictionaryCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"DictionaryCell"];
    
    self.dictionary = [[Dictionary alloc] init];
    [self.dictionary initDictionary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 26;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *wordList = [self.dictionary wordArrayForIndex:section];
    return wordList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DictionaryCell";
    DictionaryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[DictionaryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSArray *wordList = [self.dictionary wordArrayForIndex:indexPath.section];
    Word *theWord = wordList[indexPath.row];
    [cell initWithWord:theWord];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.dictionary letterFromInt:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    WordEditViewController *wevc = [[WordEditViewController alloc] initWithNibName:@"WordEditViewController" bundle:nil];

    // Pass the selected object to the new view controller.
    NSArray *wordList = [self.dictionary wordArrayForIndex:indexPath.section];
    Word *theWord = wordList[indexPath.row];
    [wevc initWithWord:theWord];
    
    // Push the view controller.
    [self.navigationController pushViewController:wevc animated:YES];
}


@end
