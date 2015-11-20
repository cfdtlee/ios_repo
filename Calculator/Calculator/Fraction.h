//
//  Fraction.h
//  FractionTest
//
//  Created by Eric on 11/16/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int denominator, numerator;

-(void) print;
-(int) numerator;
-(double) convertToNum;
-(NSString *) convertToString;
-(void) setTo: (int) n over: (int) d;
-(Fraction *) add: (Fraction *) f;
-(Fraction *) substract: (Fraction *) f;
-(Fraction *) multiply: (Fraction *) f;
-(Fraction *) divide: (Fraction *) f;
-(void) reduce;
-(NSString *) description;

@end
