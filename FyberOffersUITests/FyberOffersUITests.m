//
//  FyberOffersUITests.m
//  FyberOffersUITests
//
//  Created by Nabeel Arif on 4/25/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FyberOffersUITests : XCTestCase

@end

@implementation FyberOffersUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUIElements {
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    XCUIElement *tfUID = [[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"UID"] childrenMatchingType:XCUIElementTypeTextField].element;
    XCUIElement *tfAPIKey = [[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"API Key"] childrenMatchingType:XCUIElementTypeTextField].element;
    XCUIElement *tfAppID = [[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"App Id"] childrenMatchingType:XCUIElementTypeTextField].element;
    
    XCUIElement *settingsNavigationBar = app.navigationBars[@"Settings"];
    XCUIElement *btnSearch = settingsNavigationBar.buttons[@"Search"];
    
    
    XCTAssertTrue(tfUID.exists);
    XCTAssertTrue(tfAPIKey.exists);
    XCTAssertTrue(tfAppID.exists);
    XCTAssertTrue(settingsNavigationBar.exists);
    XCTAssertTrue(btnSearch.exists);
    
}

@end
