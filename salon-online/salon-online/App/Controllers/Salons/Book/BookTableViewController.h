//
//  BookViewController.h
//  salon-online
//
//  Created by Saperium Dev on 5/14/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Salon.h"

@interface BookTableViewController : UITableViewController

@property (nonatomic, strong) Salon* salon;
@property (nonatomic, strong) SalonCategory* category;

@end
