//
//  SCPageIndicatorView.h
//  iScribd
//
//  Created by Jesse Andersen on 9/21/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCPageIndicatorProtocol.h"

@interface SCPageIndicatorView : UIView<SCPageIndicatorProtocol>

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong, readonly) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong, readonly) UIView *emptyView;
@property (nonatomic, strong, readonly) UIView *filledView;

@property (nonatomic, strong) UIColor *dotColor;
@property (nonatomic, assign) CGSize dotSize;
@property (nonatomic, assign) CGFloat dotPadding;
@property (nonatomic, assign) CGFloat dotLineWidth;

- (UIImage *)createEmptyImage;
- (UIImage *)createFilledImage;

@end
