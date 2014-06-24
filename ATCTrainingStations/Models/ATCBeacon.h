//
//  ATCBeacon.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/24/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCBeacon : NSObject
    @property(nonatomic,strong) NSString * identifier;
    @property(nonatomic,strong) NSNumber * major;
    @property(nonatomic,strong) NSNumber * minor;

@end
