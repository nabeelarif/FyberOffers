//
//  UIColor+Theme.h
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  A UIColoer category for Our application's theme. It can contain
 *  Utility mehtods for UIColor or most commonly used color within 
 *  our app.
 */
@interface UIColor (Theme)
/**
 *
 *  @return Color for main UILabels within app
 */
+(UIColor*)labelColor;
/**
 *
 *  @return Color of UITableView's background
 */
+(UIColor*)tableViewCellBackgroundColor;
/**
 *  Get different values of you app's main color
 *
 *  @param lightness 1 means white and 0 mean black while intermediate values mean some median 
 *  value
 *
 *  @return UIColor based on provided lightness
 */
+(UIColor*)appColorWithLightness:(CGFloat)lightness;

#pragma mark - Util
/**
 *  Generates a UIColor instance based on provided value. Each color value can be specified
 *  with value ranging from 0-255 i.e 8 bit values
 *
 *  @param red   color value of red
 *  @param green color value of green
 *  @param blue  color values of blue
 *  @param alpha alpha indicating the transparancy of the color
 *
 *  @return UIColor instance of provided color values
 */
+ (UIColor*)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
/**
 *  Generates a UIColor instance based on provided hex value.
 *
 *  @param hex   hex representation of color e.g #457D8B etc. The hex should be a string of 
 *  length 7.
 *  @param alpha alpha indicating the transparancy of the color
 *
 *  @return UIColor instance of provided color values
 */
+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha;
@end
