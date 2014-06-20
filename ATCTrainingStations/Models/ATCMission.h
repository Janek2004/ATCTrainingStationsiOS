//
//  ATCMission.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/20/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCMission : NSObject
    @property(nonatomic,strong) UIImage * icon;
    @property(nonatomic,strong) NSString * title;
    @property(nonatomic,strong) NSString * description;
    @property(nonatomic,strong) NSNumber * missionid;

@end
