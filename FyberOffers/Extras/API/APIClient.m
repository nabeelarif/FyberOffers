//
//  APIClient.m
//  FyberOffers
//
//  Created by Nabeel Arif on 2/13/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "APIClient.h"
#import "OffersAPI.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>

@interface APIClient ()

@property (nonatomic,strong) OffersAPI *offersApi;

@end

@implementation APIClient

+(instancetype)sharedInstance{
    static APIClient *sharedClient;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedClient = [[self alloc] init];
        sharedClient.offersApi = [[OffersAPI alloc] init];
        [sharedClient addNetworkStatusListener];
    });
    return sharedClient;
}
-(void)addNetworkStatusListener{
    _isNetworkReachable = [AFNetworkReachabilityManager sharedManager].isReachable;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                _isNetworkReachable=YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                _isNetworkReachable=NO;
                break;
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
-(void)loadNextPageOffersForCredentials:(FyberCredentialModel*)credential apiBlock:(APIBlock)block
{
    [_offersApi loadNextPageOffersForCredentials:credential apiBlock:block];
}
@end
