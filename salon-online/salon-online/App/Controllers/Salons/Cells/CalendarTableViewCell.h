//
//  CalendarTableViewCell.h
//  salon-online
//
//  Created by Saperium Dev on 6/15/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalendarTableViewCell;
@protocol CalendarTableViewCellDelegate <NSObject>
@optional
-(void)didSelectDate:(NSDate *)date;
@end

@interface CalendarTableViewCell : UITableViewCell

@property (weak, nonatomic) id<CalendarTableViewCellDelegate> delegate;

@end
