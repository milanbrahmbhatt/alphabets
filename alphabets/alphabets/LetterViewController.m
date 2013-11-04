//
//  LetterViewController.m
//  alphabets
//
//  Created by Milan Brahmbhatt on 10/28/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "LetterViewController.h"
#import "Dictionary.h"
#import "WordView.h"

@interface LetterViewController ()
//@property (readonly, strong, nonatomic) ModelController *modelController;

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSMutableArray *subviews;

@property (strong, nonatomic) Dictionary *alphabetDictionary;

@property (nonatomic) NSInteger currentPage;
- (IBAction)changePage:(id)sender;

- (void) setScrollViewOffset: (CGPoint) offset;
@end

@implementation LetterViewController

int lastScrollX = -1;
int origScrollY;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.alphabetDictionary = [[Dictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lastScrollX = -1;
    
    NSInteger numLetters = [self letterCount];
    
    self.subviews = [NSMutableArray array];
        
    for (int i = 0; i < numLetters; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        WordView *subview = [[WordView alloc] initWithFrame:frame];
        [self.subviews addObject:subview];
        [self.scrollView addSubview:subview];
    }
    
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * (numLetters + 1);
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    WordView *subview = [[WordView alloc] initWithFrame:frame];
    [self.scrollView addSubview:subview];
    
    origScrollY = self.scrollView.frame.origin.y;
    
    CGFloat scrollViewWidth = self.scrollView.frame.size.width * (numLetters+1);
    self.scrollView.contentSize = CGSizeMake(scrollViewWidth, self.scrollView.frame.size.height);
    
    self.pageControl.numberOfPages = numLetters;
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.subviews = nil;
    self.scrollView.delegate = nil;
}

- (NSInteger) letterCount {
    return [self.alphabetDictionary.dictionary count];
}

- (void) setCurrentPage:(NSInteger)currentPage
{
    NSString *letter = [self.alphabetDictionary letterFromInt:currentPage];
    Word *word = [self.alphabetDictionary randomWordForLetter:letter];
    WordView *currentView = (WordView *)[self.subviews objectAtIndex:currentPage];
    currentView.word = word;
    
    self.pageControl.currentPage = currentPage;
    _currentPage = currentPage;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    NSLog(@" Offset = %@ ",NSStringFromCGPoint(self.scrollView.contentOffset));
    
    if (lastScrollX >= 0 && self.currentLetter != nil) {
        int currentIndex = [self.alphabetDictionary intFromLetter:self.currentLetter];
        self.currentLetter = nil;
        self.currentPage = currentIndex;
        [self changePage:nil];
        return;
    }
    
    lastScrollX = self.scrollView.contentOffset.x;

    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (page != self.currentPage) {
        int numWords = [self letterCount];
        if (page >= numWords) {
            page = 0;
            self.currentPage = page;
            [self.scrollView setContentOffset:CGPointMake(0, 0)];
            [self changePage:nil];
        } else {
            self.currentPage = page;
            [self changePage:nil];
        }
    }
}

- (IBAction)changePage:(id)sender {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:NO];
}

- (void) setScrollViewOffset: (CGPoint) offset {
    CGRect scrollBounds = self.scrollView.bounds;
    scrollBounds.origin = offset;
    self.scrollView.bounds = scrollBounds;
}

@end
