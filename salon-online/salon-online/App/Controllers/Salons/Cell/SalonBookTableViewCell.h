//
//  SalonBookTableViewCell.h
//  salon-online
//
//  Created by Saperium Dev on 3/30/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SalonCategory.h"

@class SalonBookTableViewCell;
@protocol SalonBookTableViewCellDelegate <NSObject>
@optional
-(void)didTapBook:(SalonBookTableViewCell *)cell;
@end

@interface SalonBookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *serviceName;
@property (weak, nonatomic) IBOutlet UILabel *cost;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIView *bottomDivider;
@property (nonatomic, strong) SalonCategory* category;
@property (weak, nonatomic) id<SalonBookTableViewCellDelegate> delegate;

- (IBAction)bookNow:(id)sender;


@end
