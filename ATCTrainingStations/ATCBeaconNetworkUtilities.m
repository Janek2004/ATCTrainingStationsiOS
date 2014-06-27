//
//  ATCBeaconNetworkUtilities.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/19/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCBeaconNetworkUtilities.h"

@implementation ATCBeaconNetworkUtilities

/**
    Returns json data with missions (for now) using completion handler
 
*/
-(void)getDataWithCompletionHandler:(void (^)(NSDictionary *data, NSError *error))completionBlock{
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:BEACON_URL]];

    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.dataCompletionBlock = completionBlock;
             NSError * error;
        if(!data){
             NSLog(@" Data not available ");
            return;
        }
        
        id object = [NSJSONSerialization
                     JSONObjectWithData:data
                     options:0
                     error:&error];
        
        if(error) {
            NSLog(@"Error %@",error);
            
            self.dataCompletionBlock(nil, error);
            return;
        }
        if([object isKindOfClass:[NSDictionary class]]){
             NSDictionary *results = object;
              self.dataCompletionBlock(results, error);
            
            
             //NSLog(@"%@",results);
        }else
        {
            NSLog(@" Not a dictionary ");
        }
    }];
}

-(void)getDataForBeaconMajor:(int)major minor:(int)minor proximityId:(NSString *)proximityID proximity:(CLProximity) proximity  WithCompletionHandler:(void (^)(NSDictionary *data, NSError *error))completionBlock;{
    //form request
    assert(proximityID!=NULL);
    self.beaconCompletionBlock = completionBlock;
    
    
    NSString * urlstring =[NSString stringWithFormat:@"%@&beacon_major=%d&beacon_minor=%d&beacon_uuid=%@",BEACON_URL,major,minor,proximityID];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstring]];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(!data||connectionError){
            if(!connectionError){
                connectionError = [NSError new];
            }
            if(self.beaconCompletionBlock){
                self.beaconCompletionBlock(nil, connectionError);
            }
                return;
        }
        
        NSError * error;
        id object = [NSJSONSerialization
                     JSONObjectWithData:data
                     options:0
                     error:&error];
        
        if(error) {
            NSLog(@"Error %@",error);
            if(self.beaconCompletionBlock){
                self.beaconCompletionBlock(nil, error);
            }

            return;
        }
        if([object isKindOfClass:[NSDictionary class]]){
            NSDictionary *results = object;
            if(self.beaconCompletionBlock){
                self.beaconCompletionBlock(results, error);
            }
            
            //NSLog(@"%@",results);
        }else
        {
            NSLog(@" Not a dictionary ");
        }

    
    }];

}






@end
