//
//  PlayingCard.m
//  CardGame
//
//  Created by Eric on 11/23/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] >= 1) {
        // use introspection to improve, another way is MVC binding communication
        for (PlayingCard *otherCard in otherCards) {
            if (self.rank == otherCard.rank) {
                score += 4;
            }
            else if ([self.suit isEqualToString:otherCard.suit]){
                score += 1;
            }
        }
    }
    return score;
}

-(NSString *)contents {
    NSArray *rankString = [PlayingCard rankString];
    return [rankString[self.rank] stringByAppendingString: self.suit];
}

@synthesize suit = _suit;


// a plus method is a class method, send message to class, not to instance of an object
// careat things, like string format; utility method like this, return constance(Usually these are either creation methods(like alloc or stringWithFormat: or utility methods.)
+(NSArray *)validSuits {
    return @[@"♣", @"♦", @"♥", @"♠"];
}

-(void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject: suit]) {
        _suit = suit;
    }
}

-(NSString *)suit {
    return _suit ? _suit : @"?";
}

+(NSArray *)rankString {
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger) maxRank {
    return [[self rankString] count] - 1;
}

-(void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
