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


@end


@implementation ATCContentContainerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.immediateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ATCImmediateContentDetailsViewController"];
    self.nearbyVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ATCNearbyDetailsViewController"];
    self.farVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ATCFarContentDetailsViewController"];

    
    
    
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








@end
