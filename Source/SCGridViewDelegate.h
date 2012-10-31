//
//  SCGridViewDelegate.h
//  iScribd
//
//  Created by Jesse Andersen on 9/12/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCGridView;

@protocol SCGridViewDelegate <NSObject>

@optional

- (UIView *)viewAtPosition:(NSUInteger)position inGridView:(SCGridView *)gridView coordinates:(CGPoint)coordinates size:(CGSize)size;
- (void)gridView:(SCGridView *)gridView didSelectCell:(UIView *)cell atIndex:(NSUInteger)index;

@end
