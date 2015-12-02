//
//  Card.m
//  CardGame
//
//  Created by Eric on 11/21/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "Card.h"
@interface Card() //private decorations

@end

@implementation Card

-(int) match:(NSArray *) otherCards {
    int score = 0;
    for (Card * card in otherCards) { // all objects are always porinter, so we need *
        if ([card.contents isEqualToString: self.contents]) {// dot notation for property,
            score = 1;
        }
    }
    
    return score;
}
@end