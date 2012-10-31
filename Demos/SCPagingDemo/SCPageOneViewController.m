//
//  SCFakePageViewController.m
//  SCPagingGridView
//
//  Created by Jesse Andersen on 10/30/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
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
