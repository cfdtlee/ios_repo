//
//  ViewController.m
//  coredata_ios_essential
//
//  Created by Eric on 1/1/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "PickerViewHelper.h"

@interface ViewController ()
@property (nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *choreField;
@property (weak, nonatomic) IBOutlet UITextField *personField;
@property (weak, nonatomic) IBOutlet UILabel *persistedData;
@property (weak, nonatomic) IBOutlet UIPickerView *choreRoller;
@property (nonatomic) PickerViewHelper *choreRollerHelper;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIPickerView *personRoller;
@property (nonatomic) PickerViewHelper *personRollerHelper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)choreLogTapped:(UIButton *)sender {
    NSLog(@"tap");
//    NSInteger choreRow = [self.choreRoller selectedRowInComponent:0];
//    NSInteger personRow = [self.personRoller selectedRowInComponent:0];
//    
//    ChoreMO *chore = (ChoreMO *)[self.choreRollerHelper getItemFromArray:choreRow];
//    PersonMO *person = (PersonMO *)[self.personRollerHelper getItemFromArray:personRow];

    ChoreLogMO *choreLog = (ChoreLogMO *)[self.appDelegate createChoreLogMO];
//    choreLog.person_who_did_it = person;
//    choreLog.chore_done = chore;
//    choreLog.when = [self.datePicker date];
    
//    [self.appDelegate saveContext];
//    [self updateLogList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
