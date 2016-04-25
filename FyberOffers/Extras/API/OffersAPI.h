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
@interface OffersAPI : BaseAPI
-(void)loadNextPageOffersForCredentials:(FyberCredentialModel*)credential apiBlock:(APIBlock)block;
@end
