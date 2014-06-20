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
-(void)getDataWithCompletionHandler:(void (^)(NSDictionary *data, NSError *error))completionBlock;
-(void)getDataForBeaconMajor:(int)major minor:(int)minor proximityId:(NSString *)proximityID proximity:(CLProximity) proximity WithCompletionHandler:(void (^)(NSDictionary *data, NSError *error))completionBlock;
//parse

@end
