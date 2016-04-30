//
//  BNRContainer.h
//  RandomItems
//
//  Created by Eric on 4/26/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSArray *subitems;
}

-(void)setSubitems:(NSArray*) items;
-(NSArray*)subitems;
-(instancetype)initWithItemName:(NSString *)name valueInDollars:(int)v serialNumber:(NSString *)sNumber subitems:(NSArray*)items;
+(instancetype)randomItems;
@end
