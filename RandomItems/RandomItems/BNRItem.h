//
//  BNRItem.h
//  RandomItems
//
//  Created by Eric on 4/25/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
@property(nonatomic, copy) NSString *itemName;
@property(nonatomic, copy) NSString *serialNumber;
@property(nonatomic) int valueInDollars;
@property(nonatomic, readonly, strong) NSDate *dateCreated;
@property(nonatomic, strong) BNRItem *containedItem;
@property(nonatomic, weak) BNRItem *container;


-(instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)v
                   serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *)name;

+(instancetype)randomItem;

@end
