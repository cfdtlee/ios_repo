//
//  Fraction.m
//  FractionTest
//
//  Created by Eric on 11/16/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
@synthesize numerator, denominator;


-(void) print
{
    NSLog(@"%i/%i", numerator, denominator);
}


-(double) convertToNum
{
    if (denominator == 0) {
        return NAN;
    }
    else
        return (double) numerator/denominator;
}

-(void) setTo:(int)n over:(int)d
{
    numerator = n;
    denominator = d;
}

-(void) add: (Fraction*) f
{
    numerator = numerator * f.denominator + denominator * f.numerator;
    denominator = denominator * f.denominator;
}

-(NSString *) description
{
    return [NSString stringWithFormat: @"%i/%i", numerator, denominator];
}

@end
