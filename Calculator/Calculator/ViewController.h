//
//  ViewController.h
//  Calculator
//
//  Created by Eric on 11/19/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

// Numeric Keys

-(IBAction) clickDigit:(UIButton *) sender;

// Arithmetic Opration Keys


-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

// Misc. Keys
-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;

@end

