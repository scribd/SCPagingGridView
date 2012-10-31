//
//  SCPageView.h
//  HorizontalTable
//
//  Created by Jesse Andersen on 8/30/12.
//  Copyright (c) 2012 Jesse Andersen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCPageViewDelegate.h"

@class SCPageContainerView;

typedef enum _SCPageViewState {
    SCPageViewStateResting = 0,
    SCPageViewStateTransitionPrevious,
    SCPageViewStateTransitionPreviousImmediately,
    SCPageViewStateTransitionNext,
    SCPageViewStateTransitionNextImmediately,
    SCPageViewStateTransitionInterrupted
} SCPageViewState;

@interface SCPageView : UIScrollView

// configuration
@property (nonatomic, weak) id<SCPageViewDelegate> pageDelegate;
@property (nonatomic, assign) CGFloat pagingThresholdPercent;
@property (nonatomic, assign) CGFloat pagingThresholdMinimum;
@property (nonatomic, assign) SCPagingDirection direction; // defaults to vertical
@property (nonatomic, assign) CGFloat gapBetweenPages; // defaults to 0.0f
@property (nonatomic, strong, readonly) UIView *nextGapView;
@property (nonatomic, strong, readonly) UIView *previousGapView;
@property (nonatomic, assign, readonly) NSUInteger numberOfPages;

// inner workings
@property (nonatomic, assign, readonly) NSUInteger currentPageNumber;
@property (nonatomic, assign, readonly) SCPageViewState pageViewState;

- (void)reloadData;
- (void)setCurrentPageNumber:(NSUInteger)currentPageNumber animated:(BOOL)animated fast:(BOOL)fastAnimation;

@end