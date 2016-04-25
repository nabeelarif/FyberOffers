//
//  BaseAPI.h
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^APIBlock) (BOOL success, NSArray* data);

@interface BaseAPI : NSObject
-(void)loadPaginatedDataForRequest:(NSURLRequest*)request apiBlock:(APIBlock)block;
-(void)parseResponse:(id) responseObject;
-(void)handleError:(NSURLResponse *)response error:(NSError *)error;
@property (nonatomic, readonly) NSInteger nextPage;
@property (nonatomic, readonly) NSInteger prevPage;
-(void)resetValues;
@end
