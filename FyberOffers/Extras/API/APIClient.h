//
//  APIClient.h
//  FyberOffers
//
//  Created by Nabeel Arif on 2/13/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPI.h"
#import "FyberCredentialModel.h"

#define APIClientKit [APIClient sharedInstance]
/**
 *  APTI class provides a single location to interact with Fyber api.
 *  It returns a singleton instance witch through which you can interact
 *  with different apis. Currently, it contains only OffersAPI, but in
 *  future we can extend it to include other apis as well.
 */
@interface APIClient : NSObject
/**
 *  A boolean to indicate the availablility of network
 */
@property (nonatomic,readonly) BOOL isNetworkReachable;
/**
 *  Singleton implementation of APIClient
 *
 *  @return Returns instance of APIClient
 */
+(instancetype)sharedInstance;
/**
 *  An end point to interact with offers API.
 *
 *  @param credential Credentials to communicate with Fyber API
 *  @param block      A block to communicate the success, failure and final data from API
 */
-(void)loadNextPageOffersForCredentials:(FyberCredentialModel*)credential apiBlock:(APIBlock)block;
@end
