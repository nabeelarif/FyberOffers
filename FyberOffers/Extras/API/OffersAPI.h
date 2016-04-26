//
//  RepositoriesDataController.h
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPI.h"
#import "FyberCredentialModel.h"
#import "OfferModel.h"
/**
 *  OffersAPI to get offers from Fyber server. For guide lines to see the implementation
 *  details of OffersAPI you can visit the link below
 *  @link http://developer.fyber.com/content/current/ios/offer-wall/offer-api/
 */
@interface OffersAPI : BaseAPI

/**
 *  Main method of Offers API to load offers from Fyber server. On first time call with credentials
 *  it loads first page, if you will call the same request again with same credentials it will
 *  load next page and so on. On changing credentials your data will be loaded for first page.
 *
 *  @param request NSURLRequest object
 *  @param block   A block to communicate the success, failure and final data from API
 */
-(void)loadNextPageOffersForCredentials:(FyberCredentialModel*)credential apiBlock:(APIBlock)block;
@end
