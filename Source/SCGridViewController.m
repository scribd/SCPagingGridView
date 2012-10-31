//
//  SCGridViewController.m
//  iScribd
//
//  Created by Jesse Andersen on 9/12/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCGridViewController.h"
#import "SCGridView.h"

@interface SCGridViewController () {
    BOOL _dataLoaded;
}

@property (nonatomic, weak) SCGridView *gridView;

@end

@implementation SCGridViewController

- (void)loadView {
    SCGridView *view = [[SCGridView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.gridView = view;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataLoaded = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!_dataLoaded) {
        _dataLoaded = YES;
        [self.gridView reloadData];
    }
}

#pragma mark - Grid View

- (void)setGridView:(SCGridView *)gridView {
    if (gridView != _gridView) {
        _gridView.delegate = nil;
        _gridView = gridView;
        _gridView.delegate = self;
    }
}

#pragma mark - SCGridViewDelegate

- (UIView *)viewAtPosition:(NSUInteger)position inGridView:(SCGridView *)gridView coordinates:(CGPoint)coordinates size:(CGSize)size {
    return nil;
}

@end
