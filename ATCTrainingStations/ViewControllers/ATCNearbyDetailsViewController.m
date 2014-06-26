//
//  ATCNearbyDetailsViewController.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/23/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCNearbyDetailsViewController.h"

@interface ATCNearbyDetailsViewController ()
@property (strong, nonatomic) IBOutlet UIButton *scanButton;

@end

@implementation ATCNearbyDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)enable:(BOOL)scanning;{
    [UIView animateWithDuration:2 animations:^{
        if(!scanning){
            self.scanButton.backgroundColor = [UIColor clearColor];
            [self.scanButton setTintColor:[UIColor lightGrayColor]];
        }
        else{
            self.scanButton.backgroundColor = [UIColor blueColor];
            [self.scanButton setTintColor:[UIColor whiteColor]];
        }
        
        
    } completion:^(BOOL finished) {
        self.scanButton.enabled = scanning;
    }];
    
    NSLog(@" %d Scanning  %s ", scanning, __PRETTY_FUNCTION__);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
