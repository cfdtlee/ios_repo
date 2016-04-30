//
//  BNRContainer.m
//  RandomItems
//
//  Created by Eric on 4/26/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

-(NSString*) description
{
    return [NSString stringWithFormat:@"%lu", (unsigned long)[subitems count]];
}

-(NSArray*)subitems
{
    return subitems;
}

-(void)setSubitems:(NSArray *)items
{
    subitems = items;
}

-(instancetype)initWithItemName:(NSString *)name valueInDollars:(int)v serialNumber:(NSString *)sNumber subitems:(NSArray *)items
{
    self = [super initWithItemName:name valueInDollars:v serialNumber:sNumber];
    if (self) {
        self.subitems = items;
    }
    return self;
}

-(int)valueInDollars
{
    int sum;
    for (BNRItem* item in subitems) {
        sum += item.valueInDollars;
    }
    return sum + self.valueInDollars;
}

+(instancetype)randomItems
{
    BNRItem *temp = [BNRItem randomItem];
    NSMutableArray *items;
    for (int i = 0; i < 10; i++) {
        [items addObject:[BNRItem randomItem]];
    }
    BNRContainer *container = [[BNRContainer alloc] initWithItemName:temp.itemName valueInDollars:temp.valueInDollars serialNumber:temp.serialNumber subitems:items];
    temp = nil;
    return container;
}


@end
