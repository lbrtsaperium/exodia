//
//  SalonSectionHeaderTableViewCell.h
//  salon-online
//
//  Created by Saperium Dev on 3/30/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalonSectionHeaderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *serviceName;
@property (weak, nonatomic) IBOutlet UIView *bottomDivider;
@property (weak, nonatomic) IBOutlet UIImageView *expandImage;

@end
