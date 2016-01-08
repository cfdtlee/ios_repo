//
//  ChoreLogMO.m
//  CoreDataCouresera
//
//  Created by Eric on 1/1/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "ChoreLogMO.h"
#import "ChoreMO.h"
#import "PersonMO.h"

@implementation ChoreLogMO

// Insert code here to add functionality to your managed object subclass
- (NSString *) description {
    return [NSString stringWithFormat:@"(%@) (%@) (%@)", self.chore_done.chore_name, self.person_who_did_it.person_name, self.when];
}
@end
