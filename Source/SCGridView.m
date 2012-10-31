//
//  SCGridView.m
//  iScribd
//
//  Created by Jesse Andersen on 9/12/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCGridView.h"

@interface SCGridView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation SCGridView

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapPerformed:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        self.tapGesture = tap;
    }
    return self;
}

- (void)layoutSubviews {
    NSUInteger numberOfRows = [self.schema count];
    if (numberOfRows > 0) {
        CGFloat totalRowSpacing = (numberOfRows - 1) * self.rowSpacing;
        NSUInteger rowHeight = floorf((self.bounds.size.height - totalRowSpacing) / numberOfRows);
        NSUInteger cellNumber = 0;
        CGFloat y = 0.0f;
        for (int row = 0; row < numberOfRows; ++row) {
            if (cellNumber >= [self.cells count]) {
                break;
            }
            BOOL isLastRow = (row+1 == numberOfRows);
            if (isLastRow) {
                // to correct for rounding
                rowHeight = self.bounds.size.height - y;
            }
            NSInteger numberOfCols = [[self.schema objectAtIndex:row] integerValue];
            if (numberOfCols > 0) {
                CGFloat totalColSpacing = (numberOfCols - 1) * self.colSpacing;
                NSUInteger colWidth = floorf((self.bounds.size.width - totalColSpacing) / numberOfCols);
                CGFloat x = 0.0f;
                for (int col = 0; col < numberOfCols; ++col) {
                    if (cellNumber >= [self.cells count]) {
                        break;
                    }
                    BOOL isLastCol = (col+1 == numberOfCols);
                    if (isLastCol) {
                        // to correct for rounding
                        colWidth = self.bounds.size.width - x;
                    }
                    UIView *cell = [self.cells objectAtIndex:cellNumber];
                    cell.frame = CGRectMake(x, y, colWidth, rowHeight);
                    x += (colWidth + self.colSpacing);
                    cellNumber++;
                }
            }
            y += (rowHeight + self.rowSpacing);
        }
    }
}

#pragma mark - Grid View

- (NSUInteger)size {
    NSUInteger result = 0;
    for (NSNumber *row in self.schema) {
        result += [row integerValue];
    }
    return result;
}

// [1,2,1]... [2,1,2];
- (void)setSchema:(NSArray *)schema {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[schema count]];
    for (id obj in schema) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            [result addObject:obj];
        }
    }
    _schema = [result copy];
}

- (void)reloadData {
    NSMutableArray *cells = [NSMutableArray array];
    if ([self.delegate respondsToSelector:@selector(viewAtPosition:inGridView:coordinates:size:)]) {
        NSInteger position = 0;
        NSInteger numberOfRows = [self.schema count];
        if (numberOfRows > 0) {
            for (int row = 0; row < numberOfRows; ++row) {
                NSInteger numberOfCols = [[self.schema objectAtIndex:row] integerValue];
                if (numberOfCols > 0) {
                    CGSize size = CGSizeMake(numberOfRows, numberOfCols);
                    for (int col = 0; col < numberOfCols; ++col) {
                        UIView *cell = [self.delegate viewAtPosition:position inGridView:self coordinates:CGPointMake(row, col) size:size];
                        if (!cell) {
                            // blank view
                            cell = [[UIView alloc] init];
                        }
                        [cells addObject:cell];
                        ++position;
                    }
                }
            }
        }
    }
    self.cells = cells;
}

- (void)setCells:(NSArray *)cells {
    for (UIView *view in _cells) {
        [view removeFromSuperview];
    }
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[cells count]];
    for (id obj in cells) {
        if ([obj isKindOfClass:[UIView class]]) {
            UIView *view = obj;
            view.autoresizingMask = UIViewAutoresizingNone;
            [result addObject:view];
            [self addSubview:view];
        }
    }
    _cells = result;
    [self setNeedsLayout];
}

#pragma mark - Tap Gesture

- (void)_tapPerformed:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)gestureRecognizer;
        if (tap.state == UIGestureRecognizerStateEnded) {
            if ([self.delegate respondsToSelector:@selector(gridView:didSelectCell:atIndex:)]) {
                CGPoint location = [tap locationInView:self];
                for (int i = 0; i < [self.cells count]; ++i) {
                    UIView * view = [self.cells objectAtIndex:i];
                    CGPoint local = [view convertPoint:location fromView:self];
                    if ([view pointInside:local withEvent:nil]) {
                        [self.delegate gridView:self didSelectCell:view atIndex:i];
                        break;
                    }
                }
            }
        }
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return ![[self hitTest:[touch locationInView:self] withEvent:nil] isKindOfClass:[UIControl class]];
}

@end
