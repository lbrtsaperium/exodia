//
//  SalonTableViewCell.m
//  salon-online
//
//  Created by Saperium Dev on 3/29/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import "SalonTableViewCell.h"

@implementation SalonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCell:(Salon*)salon {
    self.salonLogo.image = [UIImage imageNamed:@"sample-logo"];
    self.salonLogo.layer.cornerRadius = self.salonLogo.frame.size.height / 2;
    self.salonLogo.layer.masksToBounds = YES;
    self.salonLogo.layer.borderWidth = 0;
    self.salonLogo.contentMode = UIViewContentModeScaleAspectFill;
    
    self.name.text = salon.Name;
    self.openHours.text = salon.OpeningHourDesc;
    self.cancelationPolicy.text = salon.CancellationDesc;
    self.location.text = salon.LocationDesc;
    self.salonBanner.image = [UIImage imageNamed:salon.ImageUrl];
    
    self.star1.image = salon.Rating.integerValue >= 1 ? [UIImage imageNamed:@"icons8-star-full-50"] : [UIImage imageNamed:@"icons8-star-empty-50"];
    self.star2.image = salon.Rating.integerValue >= 2 ? [UIImage imageNamed:@"icons8-star-full-50"] : [UIImage imageNamed:@"icons8-star-empty-50"];
    self.star3.image = salon.Rating.integerValue >= 3 ? [UIImage imageNamed:@"icons8-star-full-50"] : [UIImage imageNamed:@"icons8-star-empty-50"];
    self.star4.image = salon.Rating.integerValue >= 4 ? [UIImage imageNamed:@"icons8-star-full-50"] : [UIImage imageNamed:@"icons8-star-empty-50"];
    self.star5.image = salon.Rating.integerValue >= 5 ? [UIImage imageNamed:@"icons8-star-full-50"] : [UIImage imageNamed:@"icons8-star-empty-50"];
    
    if(salon.SalonDesc != nil) {
        self.salonDesc.text = salon.SalonDesc;
    }
}

@end
