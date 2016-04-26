//
//  Utility.h
//  FyberOffers
//
//  Created by Nabeel Arif on 4/18/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject
/**
 *  Utility method to get IP address of your device
 *
 *  @return IP address of the device
 */
+ (NSString *)getIPAddress;
/**
 *  Generates SHA1 for your string.
 *
 *  @param str Any object of NSString
 *
 *  @return SHA1 representation of 'str' object.
 */
+ (NSString *)sha1ForString:(NSString *)str;

@end
