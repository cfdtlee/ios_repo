//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Eric on 5/12/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BNRItem.h"
@class BNRItem;
@interface BNRItemStore : NSObject

@property (nonatomic, readonly)NSArray *allItems;

+(instancetype)shareStore;

-(BNRItem *)createItem;
@end
