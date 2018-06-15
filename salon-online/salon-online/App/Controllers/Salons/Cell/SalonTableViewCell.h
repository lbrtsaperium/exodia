//
//  SalonTableViewCell.h
//  salon-online
//
//  Created by Saperium Dev on 3/29/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Salon.h"

@interface SalonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *openHours;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *cancelationPolicy;
@property (weak, nonatomic) IBOutlet UIImageView *salonLogo;
@property (weak, nonatomic) IBOutlet UIImageView *salonBanner;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (weak, nonatomic) IBOutlet UILabel *salonDesc;

-(void)setupCell:(Salon*)salon;

@end
