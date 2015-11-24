//
//  deck.h
//  CardGame
//
//  Created by Eric on 11/23/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#ifndef CardGame_deck_h
#define CardGame_deck_h



#endif
#include <Foundation/Foundation.h>
#include "card.h"
@interface deck : NSObject

-(void) addCard: (Card *) card atTop: (BOOL) atTop;
-(void) addCard: (Card *) card;

-(Card *) drawRandomCard;

@end