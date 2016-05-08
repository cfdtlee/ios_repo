//
//  BNRHyponsisViewController.m
//  HypnoNerd
//
//  Created by Eric on 5/7/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BNRHyponsisViewController.h"
#import "BNRHyponsisView.h"

@interface BNRHyponsisViewController ()

@end

@implementation BNRHyponsisViewController

-(void)loadView
{
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc] init];
    
    self.view = backgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
