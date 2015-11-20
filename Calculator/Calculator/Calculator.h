//
//  Calculator.h
//  Calculator
//
//  Created by Eric on 11/19/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#ifndef Calculator_Calculator_h
#define Calculator_Calculator_h
#import <UIKit/UIKit.h>
#import "Fraction.h"
@interface Calculator : NSObject
@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *accumulator;

-(Fraction *) performOperation: (char) op;
-(void) clear;

@end

#endif
