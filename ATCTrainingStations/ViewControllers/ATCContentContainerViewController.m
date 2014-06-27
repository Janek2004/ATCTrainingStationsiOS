//
//  ATCContentContainerViewController.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/24/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCContentContainerViewController.h"

#import "ATCImmediateContentDetailsViewController.h"
#import "ATCNearbyDetailsViewController.h"
#import "ATCFarContentDetailsViewController.h"
#import "ATCAppDelegate.h"
#import "ATCApplicationState.h"


typedef enum kVCType : NSUInteger {
    kFar,
    kNearby,
    kImmediate,
} kVCType;


@interface ATCContentContainerViewController()
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property(strong,nonatomic)ATCImmediateContentDetailsViewController * immediateVC;
@property(strong,nonatomic)ATCNearbyDetailsViewController *
nearbyVC;
@property(strong,nonatomic)ATCFarContentDetailsViewController *
farVC;

@property (strong, nonatomic) IBOutlet UISegmentedControl *distanceSegmentedControl;
@property (nonatomic,strong) ATCAppDelegate * appDelegate;



@end


@implementation ATCContentContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.immediateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ATCImmediateContentDetailsViewController"];
    self.nearbyVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ATCNearbyDetailsViewController"];
    self.farVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ATCFarContentDetailsViewController"];
    _appDelegate = [[UIApplication sharedApplication]delegate];
    [self changeContentBasedOnStation:self.appDelegate.application_state.currentStation];
    [self addObservers];
    
}

- (IBAction)distanceSegmentControlValueChanged:(id)sender {

    switch ([sender selectedSegmentIndex]) {
        case  kImmediate:
            [self addChildViewController:self.immediateVC];
            self.immediateVC.view.frame  = self.containerView.bounds;
            [self.containerView addSubview:self.immediateVC.view];
          
            [self.immediateVC didMoveToParentViewController:self];
            
            
            break;
            
        case kNearby:
            [self addChildViewController:self.nearbyVC];
            self.nearbyVC.view.frame  = self.containerView.bounds;
            [self.containerView addSubview:self.nearbyVC.view];
            [self.nearbyVC didMoveToParentViewController:self];
           
            break;
            
        case kFar:
            [self addChildViewController:self.farVC];
            self.farVC.view.frame  = self.containerView.bounds;
            [self.containerView addSubview:self.farVC.view];

            [self.farVC didMoveToParentViewController:self];
           
            
            break;
            
        default:
            break;
    }
    
    
}

-(void)addObservers{
    
    [self.appDelegate.application_state addObserver:self forKeyPath:@"stations" options:NSKeyValueObservingOptionInitial context:nil];
    
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if([keyPath isEqualToString:@"stations"]){
        NSDictionary * stations = [object stations];
        @try {
            [self changeContentBasedOnStation:[stations objectForKey: self.station.hash]];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception %@",exception);
        }
        @finally {
            NSLog(@"ATC");
        }

    }
}

-(void)changeContentBasedOnStation:(ATCStation *)station{
    NSLog(@"%@ %s",station,__PRETTY_FUNCTION__);
    
    //see the dynamics of change
    if(!station)
    {
        UIAlertView * al = [[UIAlertView alloc]initWithTitle:@"" message:@"You just left the region" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [al show];
    }
    else{

        if((self.station == NULL && station.proximity == CLProximityNear)||(self.station == NULL && station.proximity == CLProximityImmediate )||(self.station == NULL && station.proximity == CLProximityFar )){

             [self addChildViewController:self.nearbyVC];
             self.nearbyVC.view.frame  = self.containerView.bounds;
             [self.containerView addSubview:self.nearbyVC.view];
             [self.nearbyVC didMoveToParentViewController:self];
        }
        
        if(self.station.proximity == CLProximityImmediate && station.proximity == CLProximityNear){
            //don't do anything
        
        }
        
        if(station.proximity == CLProximityImmediate){
            //enable the button
            [self.nearbyVC enable:YES];
        
        }
        else{
            [self.nearbyVC enable:NO];
        }
    
        self.station = station;
        
    }
}


-(void)viewWillDisappear:(BOOL)animated{
   
    
}
-(void)dealloc{
    [self.appDelegate.application_state removeObserver:self forKeyPath:@"stations"];
    NSLog(@" %s",__PRETTY_FUNCTION__);
    
}




@end
