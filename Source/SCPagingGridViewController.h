//
//  SCPagingGridViewController.h
//  iScribd
//
//  Created by Jesse Andersen on 9/27/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCPageViewController.h"
#import "SCGridViewDelegate.h"

@interface SCPagingGridViewController : SCPageViewController<SCGridViewDelegate>

@property (nonatomic, strong) NSArray *schema;

// optional, ignored if less than or equal to zero
@property (nonatomic, assign) NSUInteger maxNumberOfPages;
@property (nonatomic, assign, readonly) NSUInteger totalPageSizes;

#pragma mark - Database

- (id)dataAtPosition:(NSUInteger)position;

#pragma mark - Calculations

- (NSUInteger)offsetForPageNumber:(NSUInteger)pageNumber;
- (NSNumber *)sizeForPageSchema:(NSArray *)schema;
- (NSArray *)schemaForPageNumber:(NSUInteger)pageNumber;

#pragma mark - Cells

- (NSInteger)numberOfCellsInPageView:(SCPageView *)pageView;

#pragma mark - Subclass Override Methods

- (void)configureGridView:(SCGridView *)gridView forPageNumber:(NSUInteger)pageNumber;
- (NSArray *)schemaForShortPage:(NSUInteger)pageNumber numberOfCells:(NSUInteger)numberOfCells originalSchema:(NSArray *)original inGridView:(SCGridView *)gridView;
- (Class)cellClass;
- (void)configureCell:(UIView *)cell atPosition:(NSUInteger)position;
- (void)didSelectCell:(UIView *)cell atPosition:(NSUInteger)position;

@end
