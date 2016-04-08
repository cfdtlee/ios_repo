//
//  Photographer+create.h
//  Photomania
//
//  Created by Eric on 4/3/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (create)
+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context;
@end
