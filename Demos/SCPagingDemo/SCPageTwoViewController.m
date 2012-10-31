//
//  SCPageTwoViewController.m
//  SCPagingGridView
//
//  Created by Jesse Andersen on 10/30/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCPageTwoViewController.h"

@interface SCPageTwoViewController ()

@end

@implementation SCPageTwoViewController

- (id)init {
    if (self = [super init]) {
        self.title = @"Page Two";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor blueColor];
}

@end
