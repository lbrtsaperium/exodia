//
//  SalonServicesTableViewController.m
//  salon-online
//
//  Created by Saperium Dev on 3/30/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import "SalonServicesTableViewController.h"
#import "SalonHeaderView.h"
#import "SalonTableViewCell.h"
#import "SalonSectionHeaderTableViewCell.h"
#import "SalonBookTableViewCell.h"


@interface SalonServicesTableViewController () <UIGestureRecognizerDelegate, SalonBookTableViewCellDelegate>

@end

@implementation SalonServicesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup view
    [self.navigationController setNavigationBarHidden:NO];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 257.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // setup header
    SalonHeaderView* header = (SalonHeaderView*)self.navigationItem.titleView;
    header.name.text = self.salon.Name;
    
    header.logo.image = [UIImage imageNamed:@"sample-logo"];
    header.logo.layer.cornerRadius = header.logo.frame.size.height / 2;
    header.logo.layer.masksToBounds = YES;
    header.logo.layer.borderWidth = 0;
    header.logo.contentMode = UIViewContentModeScaleAspectFill;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)scrollViewDidScroll:(UIScrollView *)contentOffset
//{
//    if(contentOffset.contentOffset.y >= 173.0) {
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//    } else if(contentOffset.contentOffset.y <= 173.0) {
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//    }
//}

- (void)handleHeaderTap:(UIGestureRecognizer *)sender {
    UIView *view = sender.view;
    
    SalonService* service = [self.salon.Services objectAtIndex:view.tag];
    service.expanded = !service.expanded;
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(self.salon != nil) {
        return self.salon.Services.count + 1;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    } else {
        SalonService* service = [self.salon.Services objectAtIndex:(section - 1)];
        // NOTE: remove to make simple
//        if(service.expanded) {
            return service.Categories.count;
//        }
//        return 0;
    }
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0) {
        return CGFLOAT_MIN;
    }
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return nil;
    } else {
        SalonSectionHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SalonSectionHeaderTableViewCell class])];
        
        SalonService* service = [self.salon.Services objectAtIndex:(section - 1)];
        cell.serviceName.text = service.Name;
        cell.tag = (section - 1);
        
        // NOTE: remove to make simple
//        if(service.hasGesture == NO) {
//            UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleHeaderTap:)];
//            [gr setDelegate:self];
//            gr.numberOfTouchesRequired = 1;
//            gr.numberOfTapsRequired = 1;
//            [cell addGestureRecognizer:gr];
//        }
        
        if(service.expanded) {
            cell.expandImage.image = [UIImage imageNamed:@"icons8-collapse-arrow-filled-50"];
            cell.bottomDivider.hidden = NO;
        } else {
            cell.expandImage.image = [UIImage imageNamed:@"icons8-expand-arrow-filled-50"];
            cell.bottomDivider.hidden = YES;
        }
        return cell;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        SalonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SalonTableViewCell class]) forIndexPath:indexPath];
        
        [cell setupCell:self.salon];
        
        return cell;
    } else {
        SalonBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SalonBookTableViewCell class]) forIndexPath:indexPath];
        
        SalonService* service = [self.salon.Services objectAtIndex:(indexPath.section - 1)];
        SalonCategory* category = [service.Categories objectAtIndex:indexPath.row];
        cell.serviceName.text = category.Name;
        cell.cost.text = [NSString stringWithFormat:@"%ld SEK", (long)category.Cost.integerValue];
        cell.desc.text = category.Desc;
        cell.delegate = self;

        if(indexPath.row == (service.Categories.count - 1)) {
            cell.bottomDivider.hidden = YES;
        }
        
        return cell;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    SalonServicesTableViewController* c = (SalonServicesTableViewController*)[segue destinationViewController];
//    c.salon = [self.salons objectAtIndex:self.selectedPath.row];
}

#pragma mark - SalonBookTableViewCellDelegate
-(void)didTapBook:(SalonBookTableViewCell *)cell {
    [self performSegueWithIdentifier:@"bookSchedule" sender:self];
}

@end
