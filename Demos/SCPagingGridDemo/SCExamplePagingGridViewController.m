//
//  Created by Jesse Andersen on 11/1/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
