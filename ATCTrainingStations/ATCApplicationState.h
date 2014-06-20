//
//  ATCApplicationState.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/20/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCApplicationState : NSObject
    @property(nonatomic, copy) void (^messageBlock)(NSString * message, BOOL show);
    @property (nonatomic,strong) NSNumber * currentMissionId;
    @property (nonatomic,strong) NSDictionary * missions;

@end
