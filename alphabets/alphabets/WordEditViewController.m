//
//  WordEditViewController.m
//  alphabets
//
//  Created by Mark Kim on 10/24/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "WordEditViewController.h"

@interface WordEditViewController ()

@end

@implementation WordEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) initWithWord:(Word *)word
{
    self.word = word;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.wordLabel.text = self.word.word;
    [self.wordImage setImage:self.word.image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
