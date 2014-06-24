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
    //NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
   //[connection start];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
            completionBlock(nil, error);
            return;
        }
        if([object isKindOfClass:[NSDictionary class]]){
             NSDictionary *results = object;
             completionBlock(results, error);
            
            
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
    
    NSString * urlstring =[NSString stringWithFormat:@"%@&major=%d&minor=%d&proximityID=%@",BEACON_URL,major,minor,proximityID];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstring]];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError * error;
        id object = [NSJSONSerialization
                     JSONObjectWithData:data
                     options:0
                     error:&error];
        
        if(error) {
            NSLog(@"Error %@",error);
            completionBlock(nil, error);
            return;
        }
        if([object isKindOfClass:[NSDictionary class]]){
            NSDictionary *results = object;
            completionBlock(results, error);
            
            
            //NSLog(@"%@",results);
        }else
        {
            NSLog(@" Not a dictionary ");
        }

    
    }];

}






@end
