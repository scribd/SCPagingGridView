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

#import "SCPageOneViewController.h"
#import "SCPageViewController.h"
#import "SCPageView.h"

@interface SCPageOneViewController ()

@property (nonatomic, weak) UIButton *directionButton;

@end

@implementation SCPageOneViewController

- (id)init {
    if (self = [super init]) {
        self.title = @"Page One";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Page Two" style:UIBarButtonItemStylePlain target:self action:@selector(_pageTwoTapped:)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor redColor];
    
    UIButton *directionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [directionButton addTarget:self action:@selector(_directionTapped:) forControlEvents:UIControlEventTouchUpInside];
    directionButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:directionButton];
    self.directionButton = directionButton;
    [self _updateDirectionButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.directionButton.center = self.view.center;
}

#pragma mark - Button Actions

- (void)_pageTwoTapped:(id)sender {
    [self.pageViewController.pageView setCurrentPageNumber:1 animated:YES fast:NO];
}

- (void)_directionTapped:(id)sender {
    self.pageViewController.pageView.direction = self.pageViewController.pageView.direction == SCPagingDirectionHorizontal ? SCPagingDirectionVertical : SCPagingDirectionHorizontal;
    [self _updateDirectionButton];
}

- (void)_updateDirectionButton {
    if (self.pageViewController.pageView.direction == SCPagingDirectionHorizontal) {
        [self.directionButton setTitle:@"Switch to Vertical" forState:UIControlStateNormal];
    } else {
        [self.directionButton setTitle:@"Switch to Horizontal" forState:UIControlStateNormal];
    }
    [self.directionButton sizeToFit];
}

@end
