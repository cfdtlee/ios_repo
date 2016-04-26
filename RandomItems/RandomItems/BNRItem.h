//
//  BNRItem.h
//  RandomItems
//
//  Created by Eric on 4/25/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

-(instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)v
                   serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *)name;

+(instancetype)randomItem;

-(void)setItemName:(NSString *)str;
-(NSString *)itemName;

-(void)setSerialNumber:(NSString *)str;
-(NSString *)serialNumber;

-(void)setValueInDollars:(int)v;
-(int)valueInDollars;

-(NSDate *)dateCreated;

@end
