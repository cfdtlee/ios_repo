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
    CGRect frame = [[UIScreen mainScreen] bounds];
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc] init];
    
    UISegmentedControl *colorControls = [[UISegmentedControl alloc] initWithItems:@[@"Red",@"Green",@"Blue"]];
    [colorControls addTarget:self action:@selector(changeHyponsisViewColor:) forControlEvents:UIControlEventValueChanged];
    [colorControls setFrame:CGRectMake(frame.origin.x+frame.size.width/4, frame.origin.y + 30, frame.origin.x+frame.size.width/2, 20)];
    [backgroundView addSubview:colorControls];
    
    CGRect textFieldRect = CGRectMake(40, 70, 230, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [backgroundView addSubview:textField];
    textField.placeholder = @"Hypno me!";
    textField.returnKeyType = UIReturnKeyDone;
//    textField.clearButtonMode = YES;

    textField.delegate = self;
    self.view = backgroundView;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    return YES;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view");
}

- (void)changeHyponsisViewColor: (id)sender
{
    BNRHyponsisView *hv = (BNRHyponsisView *)self.view;
    switch ([sender selectedSegmentIndex]) {
        case 0:
            hv.circleColor = [UIColor redColor];
            break;
        case 1:
            hv.circleColor = [UIColor greenColor];
        case 2:
            hv.circleColor = [UIColor blueColor];
        default:
            break;
    }
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
