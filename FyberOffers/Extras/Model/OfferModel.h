//
//  OfferModel.h
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OfferModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic) NSInteger *offer_id;
@property (nonatomic, strong) NSString *teaser;
@property (nonatomic, strong) NSString *required_actions;
@property (nonatomic) NSInteger *payout;
@property (nonatomic, strong) NSString *thumbnailLowres;
@property (nonatomic, strong) NSString *thumbnailHires;
@end
