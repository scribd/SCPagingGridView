//
//  SCAppDelegate.m
//  SCPagingGrid
//
//  Created by Jesse Andersen on 10/29/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCAppDelegate.h"
#import "SCExamplePagingGridViewController.h"

@interface SCAppDelegate ()

@property (nonatomic, strong) SCPagingGridViewController *pagingGridView;

@end

@implementation SCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    self.pagingGridView = [[SCExamplePagingGridViewController alloc] init];
    self.window.rootViewController = self.pagingGridView;
    
    return YES;
}

@end