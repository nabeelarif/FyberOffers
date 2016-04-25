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

@interface APIClient : NSObject
@property (nonatomic,readonly) BOOL isNetworkReachable;
+(instancetype)sharedInstance;
-(void)loadNextPageOffersForCredentials:(FyberCredentialModel*)credential apiBlock:(APIBlock)block;
@end
