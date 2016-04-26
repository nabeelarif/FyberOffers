//
//  UIFont+Theme.m
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "UIFont+Theme.h"

#define kLabelFontSize 14
#define kGitFont 14
@implementation UIFont (Theme)
+ (UIFont *)labelFont
{
    return [self labelFontOfSize:kLabelFontSize];
}

+ (UIFont *)labelFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}
@end
