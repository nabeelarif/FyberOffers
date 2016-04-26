//
//  OfferModel.h
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  Model object to hold information about a particular offer of Fyber API.
 */
@interface OfferModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic) NSInteger offer_id;
@property (nonatomic, strong) NSString *teaser;
@property (nonatomic, strong) NSString *required_actions;
@property (nonatomic) NSInteger payout;
@property (nonatomic, strong) NSString *thumbnailLowres;
@property (nonatomic, strong) NSString *thumbnailHires;
/**
 *  Parsing method of OffersModel. On receiving data from server user can use this method
 *  to parse it into OffersModel
 *
 *  @param dictionary An NSDictionary object containing information about a particular offer.
 */
-(void)parseWithDictionary:(NSDictionary *)dictionary;
@end
