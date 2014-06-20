//
//  ATCApplicationState.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/20/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCApplicationState.h"
#import "JMCBeaconManager.h"
#import "ATCBeaconNetworkUtilities.h"
@interface ATCApplicationState()
    @property(nonatomic, strong) JMCBeaconManager * beaconManager;
    @property(nonatomic, strong) ATCBeaconNetworkUtilities * networkManager;
@end

@implementation ATCApplicationState

-(instancetype)init{
    if(self = [super init]){
        _beaconManager = [JMCBeaconManager new];
        _networkManager = [ATCBeaconNetworkUtilities new];

        [self startBeaconManager];
    }
    return self;
}


-(void)startBeaconManager{
    if(![_beaconManager isEnabled])
    {
        if(self.messageBlock){
            //display error message
            self.messageBlock(@"Not Enabled", YES);

            }
    }
    
    
    __weak typeof(self) weakself = self;
    [_beaconManager registerBeaconWithProximityId:BEACON_UUID andIdentifier:@"ATC Beacon Identifier"];
       //void (^completionBlock)(NSDictionary *data, NSError *error));
    _beaconManager.beaconFound =^(int major, int minor, CLProximity  proximity){
        // get content for beacon
        [[weakself networkManager] getDataForBeaconMajor:major minor:minor proximityId: BEACON_UUID proximity:proximity WithCompletionHandler:^(NSDictionary *data, NSError *error) {
            
        }];
        
        // probably with timout?
        
    };
    
}

-(void)getMissions{
//    [_networkManager getDataForBeaconWithCompletionHandler:^(NSDictionary *data, NSError *error) {
//        if(error){
//            //display error message
//        }
//        else{
//            self.missions= data;
//        }
//        
//    }];

}


-(void)addObservers{
    [[UIApplication sharedApplication]addObserver:self forKeyPath:@"backgroundRefreshStatus" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if([keyPath isEqualToString:@"backgroundRefreshStatus"]){
        NSLog(@"Dictionary %@",change);
    }
}






@end
