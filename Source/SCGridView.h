//
//  SCGridView.h
//  iScribd
//
//  Created by Jesse Andersen on 9/12/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCGridViewDelegate.h"

@interface SCGridView : UIView

@property (nonatomic, strong) NSArray *schema;
@property (nonatomic, weak) id<SCGridViewDelegate>delegate;
@property (nonatomic, assign) CGFloat rowSpacing;
@property (nonatomic, assign) CGFloat colSpacing;
@property (nonatomic, strong) NSArray *cells;

- (void)setSchema:(NSArray *)schema;
- (void)reloadData;
- (NSUInteger)size;

@end
