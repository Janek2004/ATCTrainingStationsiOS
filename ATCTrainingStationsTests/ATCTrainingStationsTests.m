//
//  ATCTrainingStationsTests.m
//  ATCTrainingStationsTests
//
//  Created by Janusz Chudzynski on 6/11/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ATCBeaconNetworkUtilities.h"
@interface ATCTrainingStationsTests : XCTestCase
@property (nonatomic,strong) ATCBeaconNetworkUtilities * utilities;
@end

@implementation ATCTrainingStationsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _utilities = [ATCBeaconNetworkUtilities new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)testJSON{
    __block BOOL waitingForBlock = YES;
    [_utilities getDataWithCompletionHandler:^(NSDictionary *data, NSError *error) {
        NSLog(@"data %@",data);
        XCTAssertFalse(error!=NULL, @"Error %@ %s",error, __PRETTY_FUNCTION__);
        waitingForBlock = NO;
    }];

    while(waitingForBlock) {
       [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    
}


@end
