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

-(void) setNumerator:(int)n
{
    numerator = n;
}

-(void) setDenominator:(int)d
{
    denominator = d;
}

@end

//---- program section ----

int main(int argc, const char * argv[]) {
    @autoreleasepool {
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
