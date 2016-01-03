//
//  ContactsMO+CoreDataProperties.h
//  coredata_ios_essential
//
//  Created by Eric on 1/2/16.
//  Copyright © 2016 Eric. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ContactsMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactsMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *phone;

@end

NS_ASSUME_NONNULL_END
