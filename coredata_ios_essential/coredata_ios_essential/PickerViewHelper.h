//
//  PickerViewHelper.h
//  coredata_ios_essential
//
//  Created by Eric on 1/2/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewHelper : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (void) setArray:(NSArray *)incoming;

- (void) addItemToArray:(NSObject *) thing;

- (NSObject *)getItemFromArray:(NSUInteger)index;

@end
