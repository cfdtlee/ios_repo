//
//  main.m
//  prog1
//
//  Created by Eric on 11/15/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

//---- @interface section ----

@interface Fraction : NSObject

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;
-(int) numerator;
-(int) denominator;
-(double) convertToNum;

@end

//---- @implementation section ----

@implementation Fraction
{
    int numerator;
    int denominator;
}

-(void) print
{
    NSLog(@"%i/%i", numerator, denominator);
}

//  the idea that you can’t directly set or get the value of an instance variable from outside of the methods written for the class, but instead have to write setter and getter methods to do so is the principle of data encapsulation
-(void) setNumerator:(int)n
{
    numerator = n;
}

-(void) setDenominator:(int)d
{
    denominator = d;
}

-(int) numerator
{
    return numerator;
}

-(int) denominator
{
    return denominator;
}

-(double) convertToNum
{
    if (denominator != 0) {
        return (double) numerator/denominator;
    }
    else
        return NAN;
}

@end

//---- program section ----

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // The asterisk (*) in front of myFraction in its declaration says that myFraction is actually a reference (or pointer) to a Fraction object. The variable myFraction doesn’t actually store the fraction’s data
        Fraction *myFraction;
        
        // Create an instance of a Fraction
        
        myFraction = [Fraction alloc];
        myFraction = [myFraction init];
        
        // Set fraction to 1/3
        
        [myFraction setNumerator: 1];
        [myFraction setDenominator: 3];
        
        NSLog (@"myFraction is:");
        [myFraction print];
    }
}

//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello World");
//        int val1, val2, sum;
//        val1 = 1;
//        val2 = 2;
//        sum = val1 + val2;
//        NSLog(@"The result of %i PLUS %i is %i", val1, val2, sum);
//    }
//    return 0;
//}
