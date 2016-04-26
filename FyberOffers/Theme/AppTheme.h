//
//  MicroGitTheme.h
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//
// http://ngenworks.com/technology/how-we-style-our-ios-apps/

#import <Foundation/Foundation.h>
/**
 *  APPTheme provides a single point to adjust theme of your app.
 *  You can call 'applyTheme' method from your app delegate's method
 *  application:didFinishLaunchingWithOptions:
 */
@interface AppTheme : NSObject
/**
 *  Applies the theme settings implemented in the class. It mainly uses appearance
 *  of objects to manipulate the theme.
 */
+ (void)applyTheme;
@end
