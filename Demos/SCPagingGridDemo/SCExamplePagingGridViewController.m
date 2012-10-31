//
//  SCExamplePagingGridViewController.m
//  SCPagingGrid
//
//  Created by Jesse Andersen on 10/29/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCExamplePagingGridViewController.h"
#import "SCGridView.h"
#import "SCPageView.h"
#import "SCPageIndicatorView.h"

@interface SCExamplePagingGridViewController ()

@end

@implementation SCExamplePagingGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showPageIndicator];
    
    self.pageView.gapBetweenPages = 2;
    self.pageView.nextGapView.backgroundColor = [UIColor blackColor];
    self.pageView.previousGapView.backgroundColor = self.pageView.nextGapView.backgroundColor;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.schema = self.schema = @[ @[@(3), @(2), @(3)], @[@(2), @(3), @(2)], @[@(3), @(3), @(3)]  ];
    } else {
        self.schema = self.schema = @[ @[@(2), @(1), @(2)], @[@(1), @(2), @(1)], @[@(2), @(2)]  ];
    }
}

#pragma mark - SCPagingGridView

- (NSInteger)numberOfCellsInPageView:(SCPageView *)pageView {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 200;
    } else {
        return 60;
    }
}

- (void)configureGridView:(SCGridView *)gridView forPageNumber:(NSUInteger)pageNumber {
    gridView.backgroundColor = [UIColor blackColor];
    gridView.rowSpacing = 2;
    gridView.colSpacing = 2;
}

- (Class)cellClass {
    return [UILabel class];
}

- (void)configureCell:(UIView *)cell atPosition:(NSUInteger)position {
    if ([cell isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)cell;
        label.autoresizingMask = UIViewAutoresizingNone;
        label.textAlignment = UITextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:20];
    
        CGFloat red = (CGFloat)arc4random() / 0x100000000;
        CGFloat green = (CGFloat)arc4random() / 0x100000000;
        CGFloat blue = (CGFloat)arc4random() / 0x100000000;
        label.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
        label.text = [@(position) stringValue];
    }
}

- (void)didSelectCell:(UIView *)cell atPosition:(NSUInteger)position {
    [[[UIAlertView alloc] initWithTitle:@"BAM!" message:[NSString stringWithFormat:@"Tapped cell at position: %d", position] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

- (void)configurePageIndicator:(SCPageIndicatorView *)pageIndicatorView {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        pageIndicatorView.dotSize = CGSizeMake(12.0f, 12.0f);
        pageIndicatorView.dotLineWidth = 2.0f;
        pageIndicatorView.dotPadding = 6.0f;
        pageIndicatorView.dotColor = [UIColor whiteColor];
    }
}

@end
