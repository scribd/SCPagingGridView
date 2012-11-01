//
//  SCPageViewController.m
//  HorizontalTable
//
//  Created by Jesse Andersen on 8/30/12.
//  Copyright (c) 2012 Jesse Andersen. All rights reserved.
//

#import "SCPageViewController.h"
#import "SCPageView.h"
#import "SCPageIndicatorView.h"

@interface SCPageViewController ()<SCPageIndicatorDelegate> {
    BOOL _dataLoaded;
    BOOL _showPageIndicator;
}

@property (nonatomic, weak) SCPageView *pageView;
@property (nonatomic, weak) SCPageIndicatorView *pageIndicator;

@end

@implementation SCPageViewController

#pragma mark - UIViewController

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    SCPageView *pageView = [[SCPageView alloc] initWithFrame:view.bounds];
    pageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.pageView = pageView;
    [view addSubview:pageView];
    
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    _dataLoaded = NO;
    
    if (_showPageIndicator) {
        [self showPageIndicator];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!_dataLoaded) {
        _dataLoaded = YES;
        [self.pageView reloadData];
    }
}

#pragma mark - Page Indicator

- (void)showPageIndicator {
    _showPageIndicator = YES;
    if (self.isViewLoaded) {
        SCPageIndicatorView *pageIndicator = self.pageIndicator;
        CGRect frame = CGRectMake(self.pageView.frame.origin.x, self.view.bounds.size.height - 44.0f, self.pageView.frame.size.width, 44.0f);
        if (!pageIndicator) {
            pageIndicator = [[SCPageIndicatorView alloc] initWithFrame:frame];
            pageIndicator.pageIndicatorDelegate = self;
            pageIndicator.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            [self configurePageIndicator:pageIndicator];
            self.pageIndicator = pageIndicator;
        } else {
            pageIndicator.frame = frame;
        }
        pageIndicator.numberOfPages = [self numberOfPagesInPageView:self.pageView];
        [self.view addSubview:pageIndicator];
        
        frame = self.pageView.frame;
        frame.size.height = self.view.bounds.size.height - pageIndicator.frame.size.height;
        self.pageView.frame = frame;
    }
}

- (void)hidePageIndicator {
    _showPageIndicator = NO;
    if (self.pageIndicator) {
        [self.pageIndicator removeFromSuperview];
        self.pageIndicator = nil;
    }
    if (self.isViewLoaded) {
        CGRect frame = self.pageView.frame;
        frame.size.height = self.view.bounds.size.height;
        self.pageView.frame = frame;
    }
}

- (void)configurePageIndicator:(SCPageIndicatorView *)pageIndicatorView {
    // subclasses can override to customize look of page indicator
}

#pragma mark - Properties

- (void)setPageView:(SCPageView *)pageView {
    if (pageView != _pageView) {
        _pageView.pageDelegate = nil;
        _pageView.delegate = nil;
        
        _pageView = pageView;
        
        _pageView.delegate = self;
        _pageView.pageDelegate = self;
    }
}

- (void)setPages:(NSArray *)pages {
    if (pages != _pages) {
        for (id obj in _pages) {
            if ([obj isKindOfClass:[UIViewController class]]) {
                UIViewController *child = obj;
                [child willMoveToParentViewController:nil];
                if (child.isViewLoaded) {
                    [child.view removeFromSuperview];
                }
                [child removeFromParentViewController];
            }
        }
        _pages = pages;
        for (id obj in _pages) {
            if ([obj isKindOfClass:[UIViewController class]]) {
                UIViewController *child = obj;
                [self addChildViewController:child];
                [child didMoveToParentViewController:self];
            }
        }
        if (self.isViewLoaded) {
            [self.pageView reloadData];
        }
    }
}

#pragma mark - SCPageViewDelegate

- (void)pageView:(SCPageView *)pageView didChangeNumberOfPagesTo:(NSUInteger)numberOfPages {
    self.pageIndicator.numberOfPages = numberOfPages;
}

- (void)pageView:(SCPageView *)pageView didChangeCurrentPageNumberTo:(NSUInteger)currentPage {
    self.pageIndicator.currentPage = currentPage;
}

- (NSUInteger)numberOfPagesInPageView:(SCPageView *)pageView {
    return [self.pages count];
}

- (UIView *)pageForPageNumber:(NSUInteger)pageNumber inPageView:(SCPageView *)pageView {
    return [self controllerAtPageNumber:pageNumber].view;
}

- (UIView *)headerViewForPageNumber:(NSUInteger)pageNumber inPageView:(SCPageView *)pageView {
    return nil;
}

#pragma mark - Helpers

- (UIViewController *)controllerAtPageNumber:(NSUInteger)pageNumber {
    if (pageNumber < [self.pages count]) {
        id page = [self.pages objectAtIndex:pageNumber];
        if ([page isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)page;
        }
    }
    return nil;
}

#pragma mark - SCPageIndicatorDelegate

- (void)requestPageChangeTo:(NSUInteger)pageNumber panning:(BOOL)isPanning {
    [self.pageView setCurrentPageNumber:pageNumber animated:YES fast:isPanning];
}

@end

#pragma mark - SCPageView

@implementation UIViewController (SCPageViewControllerAdditions)

+ (id)ancestorOfType:(Class)klass for:(UIViewController *)child {
    UIViewController *iter = child.parentViewController;
    while (iter) {
        if ([iter isKindOfClass:klass]) {
            return iter;
        } else if (iter.parentViewController && iter.parentViewController != iter) {
            iter = iter.parentViewController;
        } else {
            iter = nil;
        }
    }
    return nil;
}

- (SCPageViewController *)pageViewController {
    return [[self class] ancestorOfType:[SCPageViewController class] for:self];
}

@end
