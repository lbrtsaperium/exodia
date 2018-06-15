//
//  SalonBookTableViewCell.m
//  salon-online
//
//  Created by Saperium Dev on 3/30/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import "SalonBookTableViewCell.h"

@implementation SalonBookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)bookNow:(id)sender {
    if([self.delegate respondsToSelector:@selector(didTapBook:)]) {
        [self.delegate didTapBook:self];
    }
}
@end
