//
//  ViewController.m
//  iphone_1
//
//  Created by Eric on 11/19/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@synthesize display;

- (IBAction) click1{
    display.text = @"1";
}

@end
