//
//  main.m
//  FractionTest
//
//  Created by Eric on 11/15/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *myFraction = [[Fraction alloc] init];
        Fraction *yourFraction = [[Fraction alloc] init];
        [myFraction setTo:2 over:3];
        [yourFraction setTo:4 over:5];
        [myFraction print];
        [yourFraction print];
        [myFraction add:yourFraction];
        NSLog(@"add up");
        [myFraction print];
        
    }
    return 0;
}
