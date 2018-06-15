//
//  BookViewController.m
//  salon-online
//
//  Created by Saperium Dev on 5/14/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import "BookTableViewController.h"
#import "CalendarTableViewCell.h"
#import "SalonTableViewCell.h"
#import "ServiceScheduleTableViewCell.h"
#import "ButtonTableViewCell.h"

@interface BookTableViewController () <CalendarTableViewCellDelegate>

@property (strong, nonatomic) NSArray *times;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSDate* selectedDate;
@property (strong, nonatomic) NSString* selectedTime;

@end

@implementation BookTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy-MM-dd";
        self.selectedDate = [NSDate date];
        
        self.selectedTime = [self currentHourMinute];
        
        NSMutableArray* buildTimes = [NSMutableArray new];
        for (int i = 6; i <= 20; i++)
        {
            [buildTimes addObject:[NSString stringWithFormat:@"%d:00", i]];
            [buildTimes addObject:[NSString stringWithFormat:@"%d:15", i]];
            [buildTimes addObject:[NSString stringWithFormat:@"%d:30", i]];
            [buildTimes addObject:[NSString stringWithFormat:@"%d:45", i]];
        }
        self.times = buildTimes;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Book";
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 257.0;
    // self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)currentHourMinute
{
    // In practice, these calls can be combined
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour + NSCalendarUnitMinute) fromDate:now];
    
    NSInteger minutes = components.minute;
    float minuteUnit = ceil((float) minutes / 15.0);
    minutes = minuteUnit * 15.0;
    [components setMinute: minutes];
    
    NSString* result = [NSString stringWithFormat:@"%ld:%ld", (long)components.hour, (long)components.minute];
    return result;
}

- (NSString *)militaryToAMPM:(NSString *)timeFrom {
    NSDateFormatter *oldFormatter = [[NSDateFormatter alloc] init];
    oldFormatter.dateFormat = @"H:mm"; // The old format
    NSDateFormatter *newFormatter = [[NSDateFormatter alloc] init];
    newFormatter.dateFormat = @"h:mm a"; // The new format
    
    NSDate *dateFrom = [oldFormatter dateFromString:timeFrom];
    NSString *newTimeFrom = [newFormatter stringFromDate:dateFrom];
    
    return newTimeFrom;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 2;
    } else  if(section == 1) {
        return 4;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0 && indexPath.section == 0) {
        SalonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SalonTableViewCell class]) forIndexPath:indexPath];
        
        [cell setupCell:self.salon];
        
        return cell;
    } else if(indexPath.row == 1 && indexPath.section == 0) {
        ServiceScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ServiceScheduleTableViewCell class]) forIndexPath:indexPath];
        
        [cell setupCell:self.category];
        
        return cell;
    } else if(indexPath.row == 0 && indexPath.section == 1) {
        CalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CalendarTableViewCell class]) forIndexPath:indexPath];
        
        cell.delegate = self;
        
        return cell;
    } else if(indexPath.row == 1 && indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicTableViewCell" forIndexPath:indexPath];
        
        cell.textLabel.text = @"Date:";
        cell.detailTextLabel.text =  [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.selectedDate]];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        return cell;
    } else if(indexPath.row == 2 && indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicTableViewCell" forIndexPath:indexPath];
        
        cell.textLabel.text = @"Time:";
        cell.detailTextLabel.text = [self militaryToAMPM:self.selectedTime];
        
        return cell;
    } else if(indexPath.row == 3 && indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicTableViewCell" forIndexPath:indexPath];
        
        cell.textLabel.text = @"Artist:";
        cell.detailTextLabel.text = @"Anyone";
        
        return cell;
    } else {
        ButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ButtonTableViewCell class]) forIndexPath:indexPath];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0) {
        return CGFLOAT_MIN;
    }
    return 20.0f;
}

#pragma mark - CalendarTableViewCellDelegate
-(void)didSelectDate:(NSDate *)date {
    self.selectedDate = date;
    [self.tableView reloadData];
}

@end
