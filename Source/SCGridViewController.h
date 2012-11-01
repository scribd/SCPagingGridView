//
//  SCGridViewController.h
//  iScribd
//
//  Created by Jesse Andersen on 9/12/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCGridViewDelegate.h"
#import "SCViewController.h"

@class SCGridView;

@interface SCGridViewController : SCViewController<SCGridViewDelegate>

@property (nonatomic, weak, readonly) SCGridView *gridView;

@end
