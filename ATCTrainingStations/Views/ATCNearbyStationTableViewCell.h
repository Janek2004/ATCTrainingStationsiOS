//
//  ATCNearbyStationTableViewCell.h
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/23/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATCNearbyStationTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UISlider *distanceSlider;

@end
