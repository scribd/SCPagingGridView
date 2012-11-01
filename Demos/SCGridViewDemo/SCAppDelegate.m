//
//  SCAppDelegate.m
//  SCGridViewDemo
//
//  Created by Jesse Andersen on 11/1/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCAppDelegate.h"
#import "SCExampleGridViewController.h"

@implementation SCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[SCExampleGridViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
