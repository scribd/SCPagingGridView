//
//  SCPageViewDelegate.h
//  HorizontalTable
//
//  Created by Jesse Andersen on 9/4/12.
//  Copyright (c) 2012 Jesse Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _SCPagingDirection {
    SCPagingDirectionVertical = 0,
    SCPagingDirectionHorizontal = 1
} SCPagingDirection;

@class SCPageView;

@protocol SCPageViewDelegate <NSObject>

- (NSUInteger)numberOfPagesInPageView:(SCPageView *)pageView;
- (UIView *)pageForPageNumber:(NSUInteger)pageNumber inPageView:(SCPageView *)pageView;

@optional

- (void)pageDidBecomeActive:(NSUInteger)pageNumber page:(UIView *)page pageView:(SCPageView *)pageView;
- (UIView *)headerViewForPageNumber:(NSUInteger)pageNumber inPageView:(SCPageView *)pageView;
- (void)pageView:(SCPageView *)pageView didChangeNumberOfPagesTo:(NSUInteger)numberOfPages;
- (void)pageView:(SCPageView *)pageView didChangeCurrentPageNumberTo:(NSUInteger)currentPage;

@end
