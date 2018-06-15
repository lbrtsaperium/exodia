//
//  ServiceScheduleTableViewCell.m
//  salon-online
//
//  Created by Saperium Dev on 6/15/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import "ServiceScheduleTableViewCell.h"

@implementation ServiceScheduleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCell:(SalonCategory*)category {
    self.serviceDetails.text = [NSString stringWithFormat:@"%@", category.Name];
    self.price.text = [NSString stringWithFormat:@"%ld SEK", (long)category.Cost.integerValue];
    self.desc.text = [NSString stringWithFormat:@"%@", category.Desc];
}
@end
