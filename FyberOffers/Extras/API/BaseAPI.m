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
            if ([self respondsToSelector:@selector(parseResponse:)]) {
                [self parseResponse:responseObject];
            }
        }
    }];
    [dataTask resume];
}
+(void)showNeteworkErrorToast
{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Network Error" description:@"Internet connection appears to be offline." type:TWMessageBarMessageTypeError];
}
-(void)parseResponse:(id)responseObject{
    //should be implemented in child class
}
-(void)resetValues{
    _prevPage = -1;
    _nextPage = 0;
}
@end
