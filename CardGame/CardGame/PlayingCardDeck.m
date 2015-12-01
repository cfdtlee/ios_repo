//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Eric on 11/24/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype) init { // return an instance type as return type
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                NSLog(@"rank is %lu%@", rank, suit);
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard: card];
                NSLog(@"card content is%@", card.contents);
            }
        }
    }
    return self;
}

@end
