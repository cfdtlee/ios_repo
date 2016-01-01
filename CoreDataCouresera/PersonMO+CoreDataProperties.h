//
//  PersonMO+CoreDataProperties.h
//  CoreDataCouresera
//
//  Created by Eric on 12/31/15.
//  Copyright © 2015 Eric. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PersonMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *person_name;
@property (nullable, nonatomic, retain) NSSet<ChoreLogMO  *> *chore_log;

@end

@interface PersonMO (CoreDataGeneratedAccessors)

- (void)addChore_logObject:(ChoreLogMO  *)value;
- (void)removeChore_logObject:(ChoreLogMO  *)value;
- (void)addChore_log:(NSSet<ChoreLogMO  *> *)values;
- (void)removeChore_log:(NSSet<ChoreLogMO  *> *)values;

@end

NS_ASSUME_NONNULL_END
