//
//  BaseAPI.h
//  FyberOffers
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  APIBlock is used to communicate the output to the calling object.
 *
 *  @param success Boolean value indicating success or failure of api
 *  @param data    Response data from api
 */
typedef void (^APIBlock) (BOOL success, NSArray* data);
/**
 *  BaseAPI contains the generic implementation of web-service api.
 *  It uses AFNetworking internally to peform api requests. And also
 *  maintains pagination data. It handles basic and general errors as well.
 *  To implement an api you can subclass it.
 */
@interface BaseAPI : NSObject
/**
 *  Main method of API to perform a Request.
 *
 *  @param request NSURLRequest object
 *  @param block   A block to communicate the success, failure and final data from API
 */
-(void)loadPaginatedDataForRequest:(NSURLRequest*)request apiBlock:(APIBlock)block;
/**
 *  Parse the final result form the service in case of success. This method will be
 *  called from base class in case of success. Child classes can parse the response
 *  and return it so that the result is send via APIBlock to the calling object.
 *
 *  @param responseObject The response object from server.
 *
 *  @return The parsed data from the child class which could be passed through
 *  APIBlock
 */
-(id)parseResponse:(id) responseObject;
/**
 *  Error handling of api in cases of failure. It displayes generic error on the message
 *  bar.
 *
 *  @param response NSURLResponse object of api call
 *  @param error    Error object
 */
-(void)handleError:(NSURLResponse *)response error:(NSError *)error;
/**
 *  An integer value of next page number. It will be used to load next page in next request.
 */
@property (nonatomic, readonly) NSInteger nextPage;
/**
 *  Stores the integer value to indicate the page number which was loaded in previous request.
 */
@property (nonatomic, readonly) NSInteger prevPage;
/**
 *  In case of change in data or parameters of API you may need to reset page numbers or
 *  any data associated with api object. You can rest those values here. The object of base
 *  class clears page numbers and sets to initial values.
 */
-(void)resetValues;
@end
