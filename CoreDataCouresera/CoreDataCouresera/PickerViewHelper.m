//
//  PickerViewHelper.m
//  CoreDataCouresera
//
//  Created by Eric on 12/24/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "PickerViewHelper.h"

@interface PickerViewHelper ()
@property (nonatomic) NSMutableArray *pickerData;
@end
@implementation PickerViewHelper

- (id) init {
    if ([super init] == nil) {
        return nil;
    }
    self.pickerData = [NSMutableArray arrayWithArray:@[]];
    return self;
}

- (void) setArray:(NSArray *)incoming {
    self.pickerData = [NSMutableArray arrayWithArray:incoming];
}

- (void) addItemToArray:(NSObject *) thing {
    [self.pickerData addObject:thing];
}

- (NSObject *)getItemFromArray:(NSUInteger)index {
    return [self.pickerData objectAtIndex:index];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerData count];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[self.pickerData objectAtIndex:row] description];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
