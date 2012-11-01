//
//  SCPageViewController.h
//  HorizontalTable
//
//  Created by Jesse Andersen on 8/30/12.
//  Copyright (c) 2012 Jesse Andersen. All rights reserved.
//

#import "SCPageViewDelegate.h"
#import "SCViewController.h"

@class SCPageIndicatorView;

@interface SCPageViewController : SCViewController<UIScrollViewDelegate, SCPageViewDelegate>

@property (nonatomic, weak, readonly) SCPageView *pageView;
@property (nonatomic, weak, readonly) SCPageIndicatorView *pageIndicator;
@property (nonatomic, strong) NSArray *pages;

- (void)showPageIndicator;
- (void)hidePageIndicator;
- (void)configurePageIndicator:(SCPageIndicatorView *)pageIndicatorView;

- (UIViewController *)controllerAtPageNumber:(NSUInteger)pageNumber;

@end

@interface UIViewController (SCPageViewControllerAdditions)

@property (nonatomic, weak, readonly) SCPageViewController *pageViewController;

@end