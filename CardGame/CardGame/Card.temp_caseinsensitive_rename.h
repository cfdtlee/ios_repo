//
//  Card.h
//  CardGame
//
//  Created by Eric on 11/21/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#ifndef CardGame_card_h
#define CardGame_card_h
@import Foundation;
@interface Card : NSObject

@property (strong, nonatomic) NSString *contents; // all objects are in heap, objective-c will manage all storage for you, strong means keep the memory for this as long as anyone has a strong pointer to it, as soon as no sttong pointer, remove it, it is called "reference counting"; weak means no strong pointer to it, set it to nil
    // nonatomic means not thread safe
    // generate getters and setters for the properties
@property (nonatomic, getter=isChosen) BOOL chosen; // rename the getter
@property (nonatomic, getter=isMatched) BOOL matched; // they don't need strong, because they are primitive type and don't stored in heap, no memory to manage, still have nonatomic, because we want getter and setter to be simple, don't have any locking code
    //why getter and setter bound checking, side effect say update UI when we set the property, manage memory
-(int) match: (NSArray *) otherCards;

@end
#endif
