//
//  FyberOffersTests.m
//  FyberOffersTests
//
//  Created by Nabeel Arif on 4/25/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Constants.h"
#import "Utility.h"
#import "FyberCredentialModel.h"
#import "APIClient.h"
#import "OffersAPI.h"

@interface FyberOffersTests : XCTestCase

@end

@implementation FyberOffersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFyberCredentialsModel {
    FyberCredentialModel *object1 = [[FyberCredentialModel alloc] init];
    object1.uid = kUID;
    object1.apiKey = kAPIKey;
    object1.appId = kAppId;
    FyberCredentialModel *object2 = [[FyberCredentialModel alloc] init];
    object2.uid = kUID;
    object2.apiKey = kAPIKey;
    object2.appId = kAppId;
    XCTAssertNotNil(object1);
    XCTAssertNotNil(object2);
    XCTAssertTrue([object1 isEqual:object1]);
    XCTAssertTrue([object1 isEqual:object2]);
    
    
    object2.appId = @"8097";
    XCTAssertFalse([object1 isEqual:object2]);
}
- (void) testIPAddressGeneration{
    NSString *ipAddress = [Utility getIPAddress];
    XCTAssertNotNil(ipAddress);
}
- (void) testSha1Generation{
    NSString *paramStr = @"appid=2070&apple_idfa=16f2b4a9-699a-4962-a433-ab61cdc3977b&apple_idfa_tracking_enabled=true&device_id=0b29f31e-3245-4783-948b-7bdeb113243c&ip=109.235.143.113&locale=de&offer_types=112&os_version=9.3&page=1&pub0=campaign2&timestamp=1461692947&uid=spiderman&1c915e3b5d42d05136185030892fbb846c278927";
    NSString *sha1 = [Utility sha1ForString:paramStr];
    XCTAssertTrue([sha1 isEqualToString:@"496f9a4de096aca8819e2a48899ec27e16a70154"]);
}
- (void) testOffersAPIWithValidCredentials{
    
    FyberCredentialModel *object = [[FyberCredentialModel alloc] init];
    object.uid = kUID;
    object.apiKey = kAPIKey;
    object.appId = kAppId;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    // wait with a time limit of 5 seconds
    dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, 5LL*NSEC_PER_SEC);
    if (dispatch_semaphore_wait(semaphore, timeout)==0) {
        NSLog(@"success, semaphore signaled in time");
    } else {
        NSLog(@"failure, semaphore didn't signal in time");
    }
    [APIClientKit loadNextPageOffersForCredentials:object apiBlock:^(BOOL success, NSArray *data) {
        
        if (success && data && [data isKindOfClass:[NSArray class]]) {
        }else if(success && data.count==0){
        }
        XCTAssertTrue((success && data && [data isKindOfClass:[NSArray class]]));
        dispatch_semaphore_signal(semaphore);
    }];
    
    dispatch_semaphore_wait(semaphore, timeout);
    
}
- (void) testOffersAPIWithInvalidCredentials{
    
    FyberCredentialModel *object = [[FyberCredentialModel alloc] init];
    object.uid = kUID;
    object.apiKey = kAPIKey;
    object.appId = @"8909";
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    // wait with a time limit of 5 seconds
    dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, 5LL*NSEC_PER_SEC);
    if (dispatch_semaphore_wait(semaphore, timeout)==0) {
        NSLog(@"success, semaphore signaled in time");
    } else {
        NSLog(@"failure, semaphore didn't signal in time");
    }
    [APIClientKit loadNextPageOffersForCredentials:object apiBlock:^(BOOL success, NSArray *data) {
        
        if (success && data && [data isKindOfClass:[NSArray class]]) {
        }else if(success && data.count==0){
        }
        XCTAssertTrue((success && data.count==0));
        dispatch_semaphore_signal(semaphore);
    }];
    
    dispatch_semaphore_wait(semaphore, timeout);
    
}
@end
