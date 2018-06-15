//
//  CalendarTableViewCell.m
//  salon-online
//
//  Created by Saperium Dev on 6/15/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import "CalendarTableViewCell.h"
#import "FSCalendar.h"

@interface CalendarTableViewCell () <FSCalendarDelegate,FSCalendarDataSource>

@property (weak, nonatomic) IBOutlet FSCalendar *calendar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarHeightConstraint;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end


@implementation CalendarTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy/MM/dd";

    [self.calendar setScope:FSCalendarScopeMonth animated:NO];
    [self.calendar selectDate:[NSDate date] scrollToDate:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - <FSCalendarDelegate>
- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    // NSLog(@"%@",(calendar.scope==FSCalendarScopeWeek?@"week":@"month"));
    _calendarHeightConstraint.constant = CGRectGetHeight(bounds);
    [self.contentView layoutIfNeeded];
}
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did select date %@",[self.dateFormatter stringFromDate:date]);
    if([self.delegate respondsToSelector:@selector(didSelectDate:)]) {
        [self.delegate didSelectDate:date];
    }
}
- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
    NSLog(@"%s %@", __FUNCTION__, [self.dateFormatter stringFromDate:calendar.currentPage]);
}
@end
