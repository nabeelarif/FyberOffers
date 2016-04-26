//
//  FyberCredentialModel.h
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  To communicate with Fyber api we need some credentials including uid,
 *  apiKey, appId. All these info is grouped together into a single model
 *  object named FyberCredentialModel.
 */
@interface FyberCredentialModel : NSObject
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic, strong) NSString *appId;
@end
