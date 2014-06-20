//
//  ATCAppDelegate.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/11/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ATCApplicationState;

@interface ATCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString * deviceId;
@property (strong, nonatomic) ATCApplicationState * application_state;

@end
