//
//  ATCViewController.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/11/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCViewController.h"
#import "ReusableDataSource.h"
#import "ATCAppDelegate.h"
#import "ATCApplicationState.h"
#import "ATCNearbyStationTableViewCell.h"
#import "ATCStation.h"

@interface ATCViewController ()<UITableViewDelegate>
@property (nonatomic,strong) ReusableDataSource * dataSource;
@property (nonatomic,strong) ATCAppDelegate * appDelegate;
@property (strong, nonatomic) IBOutlet UILabel *messageCenter;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ATCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.appDelegate = [[UIApplication sharedApplication]delegate];
    self.messageCenter.alpha =0;
    CGRect messageFrame = self.messageCenter.frame;
    self.messageCenter.frame =CGRectOffset(messageFrame, 0, CGRectGetHeight(messageFrame)-CGRectGetMaxY(messageFrame));
    
    
    self.appDelegate.application_state.messageBlock= ^void(NSString * message, BOOL show){
         NSLog(@"Message");
    };
    
    [self setupDatasource];
      //subscribe to changes to ATCApplicationState
    [self addObservers];
  }


-(void)setupDatasource{
    NSLog(@" %@ ",self.appDelegate.application_state.stations.allValues);
    
    self.dataSource = [[ReusableDataSource alloc]initWithItems:self.appDelegate.application_state.stations.allValues cellIdentifier:@"nearby_station_cell" configureCellBlock:^(ATCNearbyStationTableViewCell* cell, ATCStation * item, id indexPath) {
            NSLog(@"%@ %s",item,__PRETTY_FUNCTION__);
        if([item isKindOfClass:[ATCStation class]]){
            [cell.distanceSlider setValue:item.proximity animated:YES];
        
        }
        
        
    }];
     self.tableView.delegate = self;
     self.tableView.dataSource = self.dataSource;
     [self.tableView reloadData];
}


-(void)addObservers{
    
    [self.appDelegate.application_state addObserver:self forKeyPath:@"stations" options:NSKeyValueObservingOptionInitial context:nil];
   [self.appDelegate.application_state addObserver:self forKeyPath:@"bluetoothEnabled" options:   NSKeyValueObservingOptionInitial context:nil];
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    NSLog(@" Keypath %@",keyPath);
    if([keyPath isEqualToString:@"stations"]){
        NSLog(@"Dictionary %@",change);
        NSLog(@"%@",[object stations]);
        [self setupDatasource];
    }
    else if([keyPath isEqualToString:@"bluetoothEnabled"]){
        NSLog(@"Dictionary %@",change);
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.appDelegate.application_state.currentStation =  [self.appDelegate.application_state.stations.allValues objectAtIndex:indexPath.row];
    id vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ATCContentContainerViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
