//
//  UIFont+Theme.h
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  A UIFont category for Our application's theme. It can contain
 *  Utility mehtods for UIFont or most commonly used fonts within
 *  our app.
 */
@interface UIFont (Theme)
+ (UIFont *)labelFont;
+ (UIFont *)labelFontOfSize:(CGFloat)size;
@end
