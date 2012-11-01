//
//  SCViewController.m
//  SCPagingGridView
//
//  Created by Jesse Andersen on 11/1/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCViewController.h"

@interface SCViewController ()

@end

@implementation SCViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    BOOL result = NO;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        result = YES;
    } else {
        result = toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
    return result;
}

@end
