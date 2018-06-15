//
//  ServiceScheduleTableViewCell.h
//  salon-online
//
//  Created by Saperium Dev on 6/15/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Salon.h"

@interface ServiceScheduleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *serviceDetails;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *desc;

-(void)setupCell:(SalonCategory*)category;

@end
