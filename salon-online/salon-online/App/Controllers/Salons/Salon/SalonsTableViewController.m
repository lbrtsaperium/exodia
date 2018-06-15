//
//  SalonsTableViewController.m
//  salon-online
//
//  Created by Saperium Dev on 3/29/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import "SalonsTableViewController.h"
#import "Salon.h"
#import "SalonTableViewCell.h"
#import "SalonServicesTableViewController.h"

@interface SalonsTableViewController ()

@property (nonnull, strong) NSIndexPath* selectedPath;

@end

@implementation SalonsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup view
    [self.navigationController setNavigationBarHidden:NO];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 257.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"Salon";
    // setup right bar button
//    UIImage *myImage = [UIImage imageNamed:@"icons8-target-48"];
//    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(setMyLocation:)];
//    self.navigationItem.rightBarButtonItem = btn;

    [self createMockData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMyLocation:(id)sender {
    NSLog(@"test");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.salons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SalonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SalonTableViewCell class]) forIndexPath:indexPath];
 
    [cell setupCell:[self.salons objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedPath = indexPath;
    [self performSegueWithIdentifier:@"goToSalon" sender:self];
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
    SalonServicesTableViewController* c = (SalonServicesTableViewController*)[segue destinationViewController];
    c.salon = [self.salons objectAtIndex:self.selectedPath.row];
}

#pragma mark - Mock Data
- (void)createMockData {
    // Create mock data here
    self.salons = [NSMutableArray new];
    
    // Salon 1
    Salon* salon1 = [Salon new];
    salon1.Name = @"First Salon";
    salon1.CancellationDesc = @"24 hour cancellation";
    salon1.OpeningHourDesc = @"08:00am-06:00pm";
    salon1.LocationDesc = @"Videgatan 4B (3,3 km)";
    salon1.Rating = @5;
    salon1.ImageUrl = @"sample-banner-1";
    salon1.SalonDesc = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lobortis pellentesque vehicula. Nullam tincidunt sapien at tortor maximus ultrices. Praesent erat urna, auctor non orci sit amet, eleifend viverra elit. Cras egestas fringilla erat, non pulvinar dolor. Duis mi urna, aliquet eget dignissim vitae, porta nec ex.";
    [self.salons addObject:salon1];
    
    SalonService* service11 = [SalonService new];
    service11.Name = @"Klippning";
    SalonCategory* category11 = [SalonCategory new];
    category11.Name = @"Herr Klippning";
    category11.Cost = @200;
    category11.Desc = @"30 minutes";
    SalonCategory* category12 = [SalonCategory new];
    category12.Name = @"Barn Klippning";
    category12.Cost = @180;
    category12.Desc = @"15 minutes";
    SalonCategory* category13 = [SalonCategory new];
    category13.Name = @"Dam Klippning";
    category13.Cost = @250;
    category13.Desc = @"20 minutes";
    service11.Categories = [NSArray arrayWithObjects:category11, category12, category13, nil];
    
    SalonCategory* category14 = [SalonCategory new];
    category14.Name = @"Random Category 1";
    category14.Cost = @200;
    category14.Desc = @"30 minutes";
    SalonCategory* category15 = [SalonCategory new];
    category15.Name = @"Random Category 2";
    category15.Cost = @200;
    category15.Desc = @"30 minutes";
    
    SalonService* service12 = [SalonService new];
    service12.Name = @"Fargning";
    service12.Categories = [NSArray arrayWithObjects:category14, category15, nil];
    SalonService* service13 = [SalonService new];
    service13.Name = @"Permanent";
    service13.Categories = [NSArray arrayWithObjects:category14, category15, nil];
    SalonService* service14 = [SalonService new];
    service14.Name = @"Bryn och Fransar";
    service14.Categories = [NSArray arrayWithObjects:category14, category15, nil];
    SalonService* service15 = [SalonService new];
    service15.Name = @"Makeup";
    service15.Categories = [NSArray arrayWithObjects:category14, category15, nil];
    SalonService* service16 = [SalonService new];
    service16.Name = @"Uppsattningar";
    service16.Categories = [NSArray arrayWithObjects:category14, category15, nil];
    salon1.Services = [NSArray arrayWithObjects:service11, service12, service13, service14, service15, service16, nil];
    
    // Salon 2
    Salon* salon2 = [Salon new];
    salon2.Name = @"Second Salon";
    salon2.CancellationDesc = @"24 hour cancellation";
    salon2.OpeningHourDesc = @"09:00am-07:00pm";
    salon2.LocationDesc = @"Videgatan 4B (3,3 km)";
    salon2.Rating = @5;
    salon2.ImageUrl = @"sample-banner-2";
    salon2.SalonDesc = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lobortis pellentesque vehicula. Nullam tincidunt sapien at tortor maximus ultrices. Praesent erat urna, auctor non orci sit amet, eleifend viverra elit.";
    [self.salons addObject:salon2];
    salon2.Services = [NSArray arrayWithObjects:service11, nil];
    
    Salon* salon3 = [Salon new];
    salon3.Name = @"Third Salon";
    salon3.CancellationDesc = @"24 hour cancellation";
    salon3.OpeningHourDesc = @"06:00am-04:00pm";
    salon3.LocationDesc = @"Videgatan 4B (3,3 km)";
    salon3.Rating = @4;
    salon3.ImageUrl = @"sample-banner-1";
    salon3.SalonDesc = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lobortis pellentesque vehicula.";
    [self.salons addObject:salon3];
    salon3.Services = [NSArray arrayWithObjects:service11, nil];
    
    Salon* salon4 = [Salon new];
    salon4.Name = @"Fourth Salon";
    salon4.CancellationDesc = @"24 hour cancellation";
    salon4.OpeningHourDesc = @"08:00am-04:00pm";
    salon4.LocationDesc = @"Videgatan 4B (3,3 km)";
    salon4.Rating = @4;
    salon4.ImageUrl = @"sample-banner-2";
    salon4.SalonDesc = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    [self.salons addObject:salon4];
    salon4.Services = [NSArray arrayWithObjects:service11, nil];
    
    Salon* salon5 = [Salon new];
    salon5.Name = @"Fifth Salon";
    salon5.CancellationDesc = @"24 hour cancellation";
    salon5.OpeningHourDesc = @"09:00am-07:00pm";
    salon5.LocationDesc = @"Videgatan 4B (3,3 km)";
    salon5.Rating = @3;
    salon5.ImageUrl = @"sample-banner-1";
    salon5.SalonDesc = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lobortis pellentesque vehicula. Nullam tincidunt sapien at tortor maximus ultrices. Praesent erat urna, auctor non orci sit amet, eleifend viverra elit.";
    [self.salons addObject:salon5];
    salon5.Services = [NSArray arrayWithObjects:service11, nil];
    
    if(self.salons.count > 0) {
        self.title = [NSString stringWithFormat:@"Salon (%lu)", (unsigned long)self.salons.count];
    }
}

@end
