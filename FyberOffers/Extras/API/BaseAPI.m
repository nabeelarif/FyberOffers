//
//  BaseAPI.m
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "BaseAPI.h"
#import <AFNetworking/AFNetworking.h>
#import <TWMessageBarManager/TWMessageBarManager.h>
#import "Constants.h"

@implementation BaseAPI
-(void)handleError:(NSURLResponse *)response error:(NSError *)error
{
    if (error.code==-1009 && !response) {
        [[self class] showNeteworkErrorToast];
    }else{
        [BaseAPI showGeneralErrorToast];
    }
}
-(void)loadPaginatedDataForRequest:(NSURLRequest *)request apiBlock:(APIBlock)block
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            [self handleError:response error:error];
            block(NO,nil);
        } else {
            NSArray *offersArray;
            if ([responseObject[@"code"] isEqualToString:@"NO_CONTENT"]) {
                [BaseAPI showNoDataErrorToast];
            }else{
                offersArray = responseObject[@"offers"];
                if (offersArray.count>0) {
                    _prevPage = _nextPage;
                    _nextPage = _nextPage+1;
                }
            }
            id result = nil;
            if (offersArray && [self respondsToSelector:@selector(parseResponse:)]) {
                 result = [self parseResponse:offersArray];
            }
            block(YES, result);
        }
    }];
    [dataTask resume];
}
+(void)showNeteworkErrorToast
{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"Network Error", @"Network error Title") description:NSLocalizedString(@"Internet connection appears to be offline.", @"Network Error message") type:TWMessageBarMessageTypeError];
}
+(void)showNoDataErrorToast
{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"No Data", @"Message bar Title") description:NSLocalizedString(@"No offers are currently available for this user.", @"Message bar description") type:TWMessageBarMessageTypeError];
}
+(void)showGeneralErrorToast
{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"Error", @"Message bar Title") description:NSLocalizedString(@"An error occurred please try again latter.", @"Message bar description") type:TWMessageBarMessageTypeError];
}
-(id)parseResponse:(id)responseObject{
    //should be implemented in child class
    return nil;
}
-(void)resetValues{
    _prevPage = -1;
    _nextPage = 1;
}
@end
