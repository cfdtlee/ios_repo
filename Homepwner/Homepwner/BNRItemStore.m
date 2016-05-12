//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Eric on 5/12/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
@property(nonatomic)NSMutableArray *privateItems;
@end

@implementation BNRItemStore

+(instancetype)shareStore
{
    static BNRItemStore *shareStore = nil;
    
    if (!shareStore) {
        shareStore = [[self alloc] initPrivate];
    }
    return shareStore;
}

-(instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"use + [BNRItemStore shareStore]" userInfo:nil];
    return nil;
}

-(instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)allItems
{
    return self.privateItems;
}

-(BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end
