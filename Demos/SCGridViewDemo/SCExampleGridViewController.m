//
//  SCExampleGridViewController.m
//  SCPagingGridView
//
//  Created by Jesse Andersen on 11/1/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCExampleGridViewController.h"
#import "SCGridView.h"
#import <QuartzCore/QuartzCore.h>

@interface SCExampleGridViewController ()

@end

@implementation SCExampleGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    CGFloat height = floorf(self.view.bounds.size.height * .8f);
    CGFloat width = floorf(self.view.bounds.size.width * .8f);
    
    SCGridView *grid = [[SCGridView alloc] initWithFrame:CGRectMake(floorf((self.view.bounds.size.width - width)/2.0f), floorf((self.view.bounds.size.height - height)/2.0f), width, height)];
    grid.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    grid.layer.cornerRadius = 6.0f;
    grid.clipsToBounds = YES;
    grid.backgroundColor = [UIColor clearColor];
    grid.schema = @[ @(1), @(1), @(2) ];
    grid.rowSpacing = 5.0f;
    grid.colSpacing = 5.0f;
    [self.view addSubview:grid];
    
    NSMutableArray *cells = [[NSMutableArray alloc] initWithCapacity:grid.size];
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"1st cell";
    [cells addObject:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"2nd cell" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor whiteColor];
    [cells addObject:button];
    
    label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"3rd cell";
    [cells addObject:label];
    
    label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"4th cell";
    [cells addObject:label];
    
    grid.cells = cells;
}

@end
