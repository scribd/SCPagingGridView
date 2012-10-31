//
//  SCPageIndicatorProtocol.h
//  iScribd
//
//  Created by Jesse Andersen on 9/24/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCPageIndicatorDelegate <NSObject>

- (void)requestPageChangeTo:(NSUInteger)pageNumber panning:(BOOL)isPanning;

@end

@protocol SCPageIndicatorProtocol <NSObject>

@property (nonatomic, assign) NSUInteger numberOfPages;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, weak) id<SCPageIndicatorDelegate> pageIndicatorDelegate;

@end
