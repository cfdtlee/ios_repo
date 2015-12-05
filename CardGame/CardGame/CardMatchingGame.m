//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Eric on 11/30/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of cards, track cards

@end

@implementation CardMatchingGame

-(NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else {
                self = nil;
                break;
            }
        }
    }
    self.mode = 2;
    self.chosenNum = 1;
    return self;
}

- (void)changeMode {
    self.mode = self.mode == 2 ? 3 : 2;
}

- (void)redealWithCardCount:(NSUInteger)count
                  usingDeck:(Deck *)deck {
    [self.cards removeAllObjects];
    for (int i = 0; i < count; i++) {
        Card *card = [deck drawRandomCard];
        if (card) {
            [self.cards addObject:card];
        }
        else {
            break;
        }
    }
    self.score = 0;
}

-(Card *) cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
-(void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (card.isChosen) {
        card.chosen = NO;
        self.chosenNum -= 1;
        NSLog(@"chosenNum: %d", (int)self.chosenNum);
    }
    
    else if (self.chosenNum < self.mode-1) {
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
        self.chosenNum++;
        NSLog(@"chosenNum: %d", (int)self.chosenNum);
    }
    else {
        // match against other chosen cards
        NSMutableArray *otherCards = [[NSMutableArray alloc] init];
        for (Card *otherCard in self.cards) {
            if (otherCard.chosen && ! otherCard.isMatched) {
                [otherCards addObject: otherCard];
            }
        }
        int matchScore = [card match:otherCards];
        if (matchScore) {
            self.score += matchScore * MATCH_BONUS;
            card.matched = YES;
            for (Card *otherCard in otherCards) {
                otherCard.matched = YES;
            }
        }
        else {
            self.score -= MISMATCH_PENALTY;
            for (Card *otherCard in otherCards) {
                otherCard.chosen = NO;
                self.chosenNum--;
                NSLog(@"chosenNum: %d", (int)self.chosenNum);
            }
        }
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
}

@end
