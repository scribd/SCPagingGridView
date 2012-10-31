//
//  SCDemoPageViewController.m
//  SCPagingGridView
//
//  Created by Jesse Andersen on 10/30/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCDemoPageViewController.h"
#import "SCPageOneViewController.h"
#import "SCPageTwoViewController.h"

@interface SCDemoPageViewController ()

@end

@implementation SCDemoPageViewController

- (id)init {
    if (self = [super init]) {
        UIViewController *pageOne = [[SCPageOneViewController alloc] init];
        UIViewController *pageTwo = [[SCPageTwoViewController alloc] init];
        self.pages = @[ [[UINavigationController alloc] initWithRootViewController:pageOne], [[UINavigationController alloc] initWithRootViewController:pageTwo] ];
    }
    return self;
}

@end
