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

-(double) convertToNum {
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}

-(NSString *) convertToString {
    if (denominator == numerator) {
        if (denominator == 0) {
            return @"0";
        }
        else
            return @"1";
    }
    else
        return [NSString stringWithFormat: @"%i/%i",
                numerator, denominator];
}

-(Fraction *) add: (Fraction *) f {
    // To add two fractions:
    // a/b + c/d = ((a*d) + (b*c)) / (b * d)
    // result will store the result of the addition
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

-(Fraction *) substract: (Fraction *) f {
    // To sub two fractions:
    // a/b - c/d = ((a*d) - (b*c)) / (b * d)
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator - denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

-(Fraction *) multiply: (Fraction *) f {
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

-(Fraction *) divide: (Fraction *) f {
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    [result reduce];
    return result;
}

- (void) reduce {
    int u = numerator;
    int v = denominator;
    int temp;
    if (u == 0)
        return;
    else if (u <0)
        u = -u;
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    numerator /= u;
    denominator /= u;
}

-(void) setTo:(int)n over:(int)d
{
    numerator = n;
    denominator = d;
}


-(NSString *) description
{
    return [NSString stringWithFormat: @"%i/%i", numerator, denominator];
}

@end
