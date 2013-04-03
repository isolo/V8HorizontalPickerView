//
//  HorzPickerTestAppAppDelegate.m
//  HorzPickerTestApp
//
//  Created by Shawn Veader on 9/20/10.
//  Copyright 2010 V8 Labs, LLC. All rights reserved.
//

#import "TestViewController.h"
#import "HorzPickerTestAppAppDelegate.h"

@implementation HorzPickerTestAppAppDelegate

@synthesize window;

#pragma mark - Application lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	// Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }

- (void)applicationDidEnterBackground:(UIApplication *)application { }

- (void)applicationWillEnterForeground:(UIApplication *)application { }

- (void)applicationDidBecomeActive:(UIApplication *)application { }

- (void)applicationWillTerminate:(UIApplication *)application { }


#pragma mark - Memory management
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application { }

- (void)dealloc {
	//[window release];
	[super dealloc];
}

@end
