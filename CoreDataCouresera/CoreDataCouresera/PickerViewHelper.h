//
//  PickerViewHelper.h
//  CoreDataCouresera
//
//  Created by Eric on 12/24/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewHelper : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (void) setArray:(NSArray *)incoming;

- (void) addItemToArray:(NSObject *) thing;

- (NSObject *)getItemFromArray:(NSUInteger)index;
@end
