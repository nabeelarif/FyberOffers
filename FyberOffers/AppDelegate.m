//
//  AppDelegate.m
//  FyberOffers
//
//  Created by Nabeel Arif on 4/25/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "AppDelegate.h"
#import "AppTheme.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [AppTheme applyTheme];
    return YES;
}

@end
