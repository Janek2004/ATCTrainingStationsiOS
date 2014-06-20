//
//  ATCBeaconNetworkUtilities.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/19/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATCBeaconNetworkUtilities : NSObject

//send request
-(void)getDataWithCompletionHandler:(void (^)(NSData *data, NSError *error))completionBlock;

//parse

@end
