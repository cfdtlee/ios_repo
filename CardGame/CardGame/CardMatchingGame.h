//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Eric on 11/30/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#ifndef CardMatchingGame_h
#define CardMatchingGame_h


#endif /* CardMatchingGame_h */

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer
-(instancetype) initWithCardCount: (NSUInteger) count
                        usingDeck: (Deck *)deck;
- (void)redealWithCardCount:(NSUInteger)count
                  usingDeck:(Deck *)deck;

-(void) chooseCardAtIndex: (NSUInteger) index;
-(Card *) cardAtIndex: (NSUInteger) index;

- (void)changeMode;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSInteger mode;
@property (nonatomic) NSInteger chosenNum;

@end