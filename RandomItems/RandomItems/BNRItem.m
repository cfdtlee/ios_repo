//
//  BNRItem.m
//  RandomItems
//
//  Created by Eric on 4/25/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

//@synthesize itemName = _itemName;

-(NSString*)description
{
    NSString *descriptionString = [NSString stringWithFormat:@"%@(%@), worth $%d, recorded on%@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descriptionString;
}

-(instancetype)initWithItemName:(NSString *)name valueInDollars:(int)v serialNumber:(NSString *)sNumber
{
    self = [super init];
    if (self) {
        _itemName = name;
        _valueInDollars = v;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

-(instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

-(instancetype)init
{
    return [self initWithItemName:@"Item"];
}

-(void)setContainedItem:(BNRItem *)containedItem
{
    _containedItem = containedItem;
    _containedItem.container = self;
}

+(instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear",@"Spork",@"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}


@end
