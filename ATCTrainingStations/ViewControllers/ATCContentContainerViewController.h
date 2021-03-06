//
//  ATCContentContainerViewController.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/24/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATCBeacon.h"
#import "ATCStation.h"

@interface ATCContentContainerViewController : UIViewController

@property(strong, nonatomic) ATCBeacon * beacon;
@property(strong, nonatomic) ATCStation * station;
@property(nonatomic, copy) void (^distanceChanged)(NSString * ATCStation);


@end
