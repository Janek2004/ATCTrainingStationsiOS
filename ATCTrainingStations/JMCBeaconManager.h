//
//  JMCBeaconManager.h
//  iBeaconTest
//
//  Created by sadmin on 2/21/14.
//  Copyright (c) 2014 JanuszChudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;

@interface JMCBeaconManager : NSObject

-(void)registerBeaconWithProximityId:(NSString*)pid andIdentifier:(NSString *)identifier major:(int)major andMinor:(int)minor;
-(NSString *)generateID:(NSString *)beaconId andMajor:(NSString *)major andMinor:(NSString *)minor;
-(void)registerBeaconWithProximityId:(NSString*)pid andIdentifier:(NSString *)identifier;

-(BOOL)isEnabled;
-(BOOL)CanDeviceSupportAppBackgroundRefresh;

@property(nonatomic,strong)UITextView * logView;
@property(nonatomic, copy) void (^beaconFound)(int major, int minor, CLProximity proximity);

@end
