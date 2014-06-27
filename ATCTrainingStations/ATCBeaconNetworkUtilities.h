//
//  ATCBeaconNetworkUtilities.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/19/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface ATCBeaconNetworkUtilities : NSObject

//send request
 @property(nonatomic, copy) void (^dataCompletionBlock)(NSDictionary *data, NSError *error);
 @property(nonatomic, copy) void (^beaconCompletionBlock)(NSDictionary *data, NSError *error);


-(void)getDataWithCompletionHandler:(void (^)(NSDictionary *data, NSError *error))completionBlock;
-(void)getDataForBeaconMajor:(int)major minor:(int)minor proximityId:(NSString *)proximityID proximity:(CLProximity) proximity WithCompletionHandler:(void (^)(NSDictionary *data, NSError *error))completionBlock;
//parse

@end
