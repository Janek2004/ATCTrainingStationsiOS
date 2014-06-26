//
//  ATCApplicationState.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/20/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATCStation.h"

@interface ATCApplicationState : NSObject
    @property(nonatomic, copy) void (^messageBlock)(NSString * message, BOOL show);
    @property (nonatomic,strong) NSNumber * currentMissionId;
    @property (nonatomic,strong) NSMutableDictionary * missions;
    @property (nonatomic,strong) ATCStation* currentStation;
    @property (nonatomic,strong) NSMutableDictionary * stations;
    @property (nonatomic,assign) BOOL offlineMode;
    @property (nonatomic, assign) BOOL bluetoothEnabled;



@end
