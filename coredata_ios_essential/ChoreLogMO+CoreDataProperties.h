//
//  ChoreLogMO+CoreDataProperties.h
//  coredata_ios_essential
//
//  Created by Eric on 1/2/16.
//  Copyright © 2016 Eric. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChoreLogMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChoreLogMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *when;
@property (nullable, nonatomic, retain) ChoreMO *chore_down;
@property (nullable, nonatomic, retain) PersonMO *person_who_did;

@end

NS_ASSUME_NONNULL_END
