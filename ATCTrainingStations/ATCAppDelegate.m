//
//  ATCAppDelegate.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/11/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCAppDelegate.h"
#import "ATCBlueBackgroundView.h"
#import "ATCBeaconNetworkUtilities.h"
#import "ATCApplicationState.h"


@implementation ATCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    self.deviceId =[defaults objectForKey:@"NSUUID"];
    
    if(!self.deviceId){
        NSString * uuid = [[NSUUID UUID]UUIDString];
        [defaults setObject:uuid forKey:@"NSUUID"];
        self.deviceId = uuid;
    }
   
    UIImage * image = [[UIImage imageNamed:@"toolbar"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];;
    
    [[UIToolbar appearance]setBackgroundImage:image forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UIToolbar appearance]setBackgroundImage:image forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsLandscapePhone];
    
    [[ATCBlueBackgroundView appearance]setBackgroundColor:[UIColor colorWithRed:205.0/255 green:236.0/255  blue:249.0/255 alpha:1]];
    ATCBeaconNetworkUtilities * beacon = [[ATCBeaconNetworkUtilities alloc]init];
    [beacon getDataWithCompletionHandler:^(NSDictionary *data, NSError *error) {
            
    }];
    
    _application_state = [[ATCApplicationState alloc]init];
    
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
