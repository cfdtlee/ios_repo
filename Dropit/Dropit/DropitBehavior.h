//
//  DropitBehavior.h
//  Dropit
//
//  Created by Eric on 1/6/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;
- (UIGravityBehavior *)gravity;
- (UICollisionBehavior *)collider;
@end
