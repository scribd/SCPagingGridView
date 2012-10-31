//
//  SCAppDelegate.m
//  SCPagingExample
//
//  Created by Jesse Andersen on 10/30/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCAppDelegate.h"
#import "SCDemoPageViewController.h"

@implementation SCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[SCDemoPageViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
