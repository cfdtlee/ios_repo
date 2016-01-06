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
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.choreRollerHelper = [[PickerViewHelper alloc]init];
    [self.choreRoller setDelegate:self.choreRollerHelper];
    [self.choreRoller setDataSource:self.choreRollerHelper];
    
    
    self.personRollerHelper = [[PickerViewHelper alloc]init];
    [self.personRoller setDelegate:self.personRollerHelper];
    [self.personRoller setDataSource:self.personRollerHelper];

    [self updateLogList];
    [self updateChoreRoller];
    [self updatePersonRoller];
}

- (IBAction)choreTapped:(UIButton *)sender {
    NSLog(@"tap");
    ChoreMO *c = [self.appDelegate createChoreMO];
    c.chore_name = self.choreField.text;
    [self.appDelegate saveContext];
    [self updateLogList];
    [self updateChoreRoller];
}


- (IBAction)personTapped:(UIButton *)sender {
    NSLog(@"tap");
    PersonMO *p = [self.appDelegate createPersonMO];
    p.person_name = self.personField.text;
    [self.appDelegate saveContext];
    [self updatePersonRoller];
}

- (IBAction)choreLogTapped:(UIButton *)sender {
    NSLog(@"tap");
    NSInteger choreRow = [self.choreRoller selectedRowInComponent:0];
    NSInteger personRow = [self.personRoller selectedRowInComponent:0];
    
    ChoreMO *chore = (ChoreMO *)[self.choreRollerHelper getItemFromArray:choreRow];
    PersonMO *person = (PersonMO *)[self.personRollerHelper getItemFromArray:personRow];
    
    ChoreLogMO *choreLog = (ChoreLogMO *)[self.appDelegate createChoreLogMO];
    choreLog.person_who_did = person;
    choreLog.chore_down = chore;
    choreLog.when = [self.datePicker date];
    
    [self.appDelegate saveContext];
    [self updateLogList];
}


- (IBAction)deleteTapped:(UIButton *)sender {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chore"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Chore objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    for (ChoreMO *c in results) {
        [moc deleteObject:c];
    }
    
    request = [NSFetchRequest fetchRequestWithEntityName:@"person"];
    
    error = nil;
    results = [moc executeFetchRequest:request error:&error]; //
    if (!results) {
        NSLog(@"Error fetching person object: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    for(PersonMO *p in results) {
        [moc deleteObject:p];
    }
    
    request = [NSFetchRequest fetchRequestWithEntityName:@"ChoreLog"];
    
    error = nil;
    results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching ChoreLog objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    for (ChoreLogMO *cl in results){
        [moc deleteObject:cl];
    }
    
    [self.appDelegate saveContext]; // forget this line
    [self updateLogList];
    [self updateChoreRoller];
}

- (void)updateLogList {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ChoreLog"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching ChoreLog object: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSMutableString *buffer = [NSMutableString stringWithString:@""];
    
    for (ChoreLogMO *c in results) {
        [buffer appendFormat:@"\n%@", c, nil];
    }
    self.persistedData.text = buffer;
}

- (void) updateChoreRoller {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chore"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Chore object: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSMutableArray *choreData = [[NSMutableArray alloc]init];
    for(ChoreMO *c in results) {
        [choreData addObject:c.chore_name];
    }
    [self.choreRollerHelper setArray:choreData];
    [self.choreRoller reloadAllComponents];
}

- (void) updatePersonRoller {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Person object: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    //    NSMutableArray *personData = [[NSMutableArray alloc]init];
    NSMutableArray *personData = [NSMutableArray arrayWithArray:@[]];
    for(PersonMO *p in results) {
        [personData addObject:p];
    }
    [self.personRollerHelper setArray:personData];
    [self.personRoller reloadAllComponents];
}

@end
