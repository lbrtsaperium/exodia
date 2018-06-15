//
//  Salon.h
//  salon-online
//
//  Created by Saperium Dev on 3/29/18.
//  Copyright © 2018 excodia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SalonService.h"
#import "SalonCategory.h"

@interface Salon : NSObject

@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSString* ImageUrl;
@property (nonatomic, strong) NSNumber* Rating;
@property (nonatomic, strong) NSString* LocationDesc;
@property (nonatomic, strong) NSString* OpeningHourDesc;
@property (nonatomic, strong) NSString* CancellationDesc;
@property (nonatomic, strong) NSString* SalonDesc;
@property (nonatomic, strong) NSArray* Services;

@end
