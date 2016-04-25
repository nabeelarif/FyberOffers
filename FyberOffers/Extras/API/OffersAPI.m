//
//  RepositoriesDataController.m
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "OffersAPI.h"
#import "Utility.h"
#import <AdSupport/AdSupport.h>
#import <UIKit/UIKit.h>
#import "Constants.h"


@interface OffersAPI ()
@property (nonatomic,strong) FyberCredentialModel *credential;
@end

@implementation OffersAPI

-(void)loadNextPageOffersForCredentials:(FyberCredentialModel*)credential apiBlock:(APIBlock)block;
{
    self.credential = credential;
    NSString *strURL = [self offersReques];
    NSURL *URL = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self loadPaginatedDataForRequest:request apiBlock:block];
}
-(void)parseResponse:(id)responseObject{
    
}
-(void)setCredential:(FyberCredentialModel *)credential{
    if ([credential isEqual:credential]==NO) {
        [self resetValues];
    }
    _credential = credential;
}
#pragma mark - Generate Request url
-(NSString*)offersReques{
    
    assert(_credential.uid != nil);
    assert(_credential.apiKey != nil);
    assert(_credential.appId != nil);
    NSMutableDictionary<NSString*,NSString*> *params = [NSMutableDictionary<NSString*,NSString*> new];
    
    
    [params setObject:_credential.uid forKey:@"uid"];
    [params setObject:_credential.appId forKey:@"appid"];
    [params setObject:[Utility getIPAddress] forKey:@"ip"];
    //NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    [params setObject:@"de" forKey:@"locale"];
    [params setObject:[[[[UIDevice currentDevice] identifierForVendor] UUIDString] lowercaseString] forKey:@"device_id"];
    [params setObject:@"campaign2" forKey:@"pub0"];
    [params setObject:@"1" forKey:@"page"];
    [params setObject:[NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]] forKey:@"timestamp"];
    //NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    [params setObject:@"9.3" forKey:@"os_version"];
    [params setObject:[[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] lowercaseString] forKey:@"apple_idfa"];
    [params setObject:[[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]?@"true":@"false" forKey:@"apple_idfa_tracking_enabled"];
    
    NSArray *sortedArray = [params.allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    //Concatenate sorted params
    NSMutableString *concatedStr = [NSMutableString new];
    NSMutableArray<NSString*> *temp = [NSMutableArray<NSString*> new];
    for (NSString *key in sortedArray) {
        [temp addObject:[NSString stringWithFormat:@"%@=%@",key,[params objectForKey:key]]];
    }
    [concatedStr appendString:[temp componentsJoinedByString:@"&"]];
    
    //Append Api Key
    NSString *strForHash = [NSString stringWithFormat:@"%@&%@",concatedStr,_credential.apiKey];
    //    [concatedStr appendFormat:@"&%@",apiKey];
    
    //Generate Hash Key
    NSString *hashkey = [Utility sha1ForString:strForHash];
    
    //Append Hash key
    [concatedStr appendFormat:@"&hashkey=%@",hashkey];
    
    NSString *urlStrOffers = [NSString stringWithFormat:@"%@?%@",kURLBaseOffers,concatedStr];

    return urlStrOffers;
}
@end
