//
//  deck.m
//  CardGame
//
//  Created by Eric on 11/23/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "deck.h"

@interface deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation deck

-(NSMutableArray *)cards{
    // if we send message to nil, nothing will happened, no error will happen, just return 0
    // lazy instantiation
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void) addCard:(Card *)card atTop:(BOOL) atTop {
    if (atTop) {
        [self.cards insertObject: card atIndex: 0];
    }
    else {
        [self.cards addObject: card];
    }
}

-(void) addCard:(Card *)card {
    [self.cards addObject: card];
}

-(Card *) drawRandomCard {
    Card *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex: index];
    }
    return randomCard;
}
@end


