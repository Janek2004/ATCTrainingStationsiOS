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
#import "ATCAppDelegate.h"
#import "ATCStation.h"

@interface ATCApplicationState()
    @property(nonatomic, strong) JMCBeaconManager * beaconManager;
    @property(nonatomic, strong) ATCBeaconNetworkUtilities * networkManager;
@end

@implementation ATCApplicationState

-(instancetype)init{
    if(self = [super init]){
        _beaconManager = [JMCBeaconManager new];
        _networkManager = [ATCBeaconNetworkUtilities new];
        _missions = [NSMutableDictionary new];
        _stations = [NSMutableDictionary new];
        
        [self startBeaconManager];
        [self getMissions];
    }
    
    return self;
}


-(void)startBeaconManager{
    if(![_beaconManager isEnabled])
    {
        if(self.messageBlock){
            //display error message
            self.messageBlock(@"Bluetooth Not Enabled", YES);
            
        }
    }
    else{
        self.bluetoothEnabled = YES;
    }
    
    __weak typeof(self) weakself = self;
    NSMutableDictionary * stations = [self.stations mutableCopy]; ;
    
    [self.beaconManager registerBeaconWithProximityId:BEACON_UUID andIdentifier:@"ATC BEACON" major:-1 andMinor:-1];
    self.beaconManager.beaconFound =^(int major, int minor, CLProximity  proximity){
        
        NSString * hash = [NSString stringWithFormat:@"%d%d%@",major,minor,BEACON_UUID];
       // ATCApplicationState * strongSelf = self;
        ATCStation * station = [stations objectForKey:hash];
       
        
        if(!station){
            [ weakself.networkManager getDataForBeaconMajor:major minor:minor proximityId: BEACON_UUID proximity:proximity WithCompletionHandler:^(NSDictionary *data, NSError *error) {
              //  NSLog(@"Data %@",data);
               // NSLog(@"Error %@",error);
                
                // NSMutableDictionary * temp =  weakself.stations;
                if(!error && data){
                    //save to dictionary
                    
                    ATCStation * station =[ATCStation new];
                    station.dict = [data mutableCopy];
                    station.proximity = proximity;
                    station.hash = hash;
                    [stations setObject:station forKey:hash];
                }
                 weakself.stations = stations;
            }];
        }else{

            station.proximity = proximity;
            [stations setObject:station forKey:hash];

            if(proximity== CLProximityUnknown){
                [stations removeObjectForKey:hash];
                weakself.currentStation = NULL;
            }
            
                @try {
                    [weakself setStations:stations];
                    
                    
                    
                }
                @catch (NSException * e) {
                    NSLog(@"Exception: %@", e);
                }
                @finally {
                    NSLog(@"finally");
                }
                
               
        
            
            }
    };
}

///create hash




-(void)getMissions{
#warning FIX IT
    [ _networkManager getDataWithCompletionHandler:^(NSDictionary *data, NSError *error) {
          if(!error){
              self.missions = [[data mutableCopy]objectForKey:@"missions"];
              //NSLog(@"%@",self.missions);

              //get all stations
              for(id object in self.missions){
                  
                  if([object isKindOfClass:[NSDictionary class]]){
                      NSArray * a = [object objectForKey:@"stations"];
                      //copy stations
                      NSMutableDictionary * locSt= [self.stations  mutableCopy];
                      for(id station in a){
                          [locSt setObject:station forKey: [station objectForKey:@"id"]];
                      }
                      //self.stations = locSt;
                  }
                  else{
                      //NSLog(@"%@",object);
                  }
              }
              NSLog(@"Content Loaded");
          
           // ATCAppDelegate * d =  [[UIApplication sharedApplication]delegate];
           // NSLog(@"d %@", d.application_state.missions);
          //  NSLog(@"d %@", d.application_state.stations);
          }
          
          
    }];

}


-(void)addObservers{
    [[UIApplication sharedApplication]addObserver:self forKeyPath:@"backgroundRefreshStatus" options:NSKeyValueObservingOptionNew context:nil];
    

    
    //[CLLocationManager isMonitoringAvailableForClass:[CLRegion class]] &&[CLLocationManager authorizationStatus ]== kCLAuthorizationStatusAuthorized;
    
    
    
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if([keyPath isEqualToString:@"backgroundRefreshStatus"]){
        NSLog(@"Dictionary %@",change);
    }
    
    
    
    
}






@end
