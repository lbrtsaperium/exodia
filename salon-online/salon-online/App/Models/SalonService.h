//
//  SalonService.h
//  salon-online
//
//  Created by Saperium Dev on 3/30/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SalonService : NSObject

@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSArray* Categories;

@property (nonatomic) Boolean expanded;
@property (nonatomic) Boolean hasGesture;

@end
