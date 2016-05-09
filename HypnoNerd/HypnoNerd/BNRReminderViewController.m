//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Eric on 5/8/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property(nonatomic, weak) IBOutlet UIDatePicker *datepicker;

@end

@implementation BNRReminderViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
        tbi.image = [UIImage imageNamed:@"Time.png"];
    }
    return self;
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datepicker.date;
    NSLog(@"setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view.");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datepicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
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
