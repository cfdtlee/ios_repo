//
//  ViewController.m
//  CardGame
//
//  Created by Eric on 11/21/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


// weak is because this label is held strongly by view itself, so we don't need to make it strong to keep it, the label will, if this label ever leaves the view it will get cleaned out from the heap, and this property, this pointer to it will get set to nil, which is exactly what we want, because if it is not in view, we don't want to sent message to it
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

// IBAction is actually typedef of void, in case of generating a target

@end
