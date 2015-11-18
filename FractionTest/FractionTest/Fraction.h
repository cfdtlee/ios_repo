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
-(void) setTo: (int) n over: (int) d;
-(void) add: (Fraction *) f;
-(NSString *) description;

@end
