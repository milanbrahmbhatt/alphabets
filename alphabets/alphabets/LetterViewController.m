//
//  LetterViewController.m
//  alphabets
//
//  Created by Milan Brahmbhatt on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "LetterViewController.h"
#import "DictionaryTableViewController.h"

@interface LetterViewController ()

@end

@implementation LetterViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.letterLabel.text = self.dataObject.firstLetter;
    self.word.text = self.dataObject.word;
    // TODO image load
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDictionaryTap:(id)sender {
    DictionaryTableViewController *dtvc = [[DictionaryTableViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:dtvc];
    
    dtvc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    [self presentViewController:nc animated:YES completion:nil];

}
@end
