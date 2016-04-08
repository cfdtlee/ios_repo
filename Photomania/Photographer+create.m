//
//  Photographer+create.m
//  Photomania
//
//  Created by Eric on 4/3/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "Photographer+create.h"

@implementation Photographer (create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photographer *photographer = nil;
    
    if([name length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if ([matches count]) {
            photographer = [matches firstObject];
        } else {
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer" inManagedObjectContext:context];
            photographer.name = name;
        }

        
    }
    return photographer;
}


@end
