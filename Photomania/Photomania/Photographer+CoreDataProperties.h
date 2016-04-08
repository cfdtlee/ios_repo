//
//  Photographer+CoreDataProperties.h
//  Photomania
//
//  Created by Eric on 4/3/16.
//  Copyright © 2016 Eric. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photographer.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photographer (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *photos;

@end

@interface Photographer (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(NSManagedObject *)value;
- (void)removePhotosObject:(NSManagedObject *)value;
- (void)addPhotos:(NSSet<NSManagedObject *> *)values;
- (void)removePhotos:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
