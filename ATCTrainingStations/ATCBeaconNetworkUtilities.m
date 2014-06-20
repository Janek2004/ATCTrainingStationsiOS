//
//  ATCBeaconNetworkUtilities.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/19/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCBeaconNetworkUtilities.h"

@implementation ATCBeaconNetworkUtilities

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)getDataWithCompletionHandler:(void (^)(NSData *data, NSError *error))completionBlock{
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:BEACON_URL]];
    //NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
   //[connection start];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
             NSError * error;
        id object = [NSJSONSerialization
                     JSONObjectWithData:data
                     options:0
                     error:&error];
        
        if(error) {
            NSLog(@"Error %@",error);
        }
        if([object isKindOfClass:[NSDictionary class]]){
          
             NSDictionary *results = object;
             NSLog(@"%@",results);
        }
    }];
}







@end
