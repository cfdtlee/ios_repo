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
        
        
        NSNumber *myNumber, *floatNumber, *intNumber;
        NSInteger myInt; // Note that NSInteger is not an object, but a typedef for a basic data type. It is typedef’ed either to a long for 64-bit builds or to an int for 32-bit builds. A similar typedef for NSUInteger exists for working with unsigned integers in your program.
        
        // integer value
        intNumber = [NSNumber numberWithInt: 100];
        myInt = [intNumber integerValue];
        NSLog(@"myInt = %li", (long)myInt);
        
        myNumber = @0xabcdefL;
        NSLog(@"myNumber's longvalue is: %lx", [myNumber longValue]);
        
        NSString *str = @"so called %@ expression";
        NSLog(@"This is %@", str);
        NSLog(@"This is NSNumber: %@", intNumber);
        
        // You can also use the %@ format characters to display the entire contents of arrays, dictionaries, and sets. In fact, you can use them to display objects from your own classes, as well, as long as you override the description method inherited by your class. If you do not override the method, NSLog simply displays the name of the class the object belongs to and the address of the object in memory.
        NSLog(@"myFraction is %@", myFraction);
        
        
        // Array
        NSArray *monthNames = [NSArray arrayWithObjects: @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil]; // To mark the end of the list, nil must be specified as the last value in the list; it is not actually stored inside the array.
        // a easy way to set up array: @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"], dont need nil.
        for (int i = 0; i < 12; ++i) {
            NSLog(@" %2i  %@", i+1, [monthNames objectAtIndex:i]); // array[index] is allowed, as well as array[index] = object
        }
        
        NSMutableArray *numbers = [NSMutableArray array]; // mutableArray
        for (int i = 0; i < 10; ++i )
            numbers[i] = @(i); // [numbers addObject: @(i)]; append
        for (int i = 0; i < 10; ++i )
            NSLog (@"%@", numbers[i]);
        
        // fast enumeration, %@ can used at array
        NSLog (@"%@", numbers);
        
    }
    return 0;
}
