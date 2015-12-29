//
//  ChoreLogMO .m
//  CoreDataCouresera
//
//  Created by Eric on 12/22/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "ChoreLogMO .h"
#import "ChoreMO.h"
#import "PersonMO.h"

@implementation ChoreLogMO_

// Insert code here to add functionality to your managed object subclass

- (NSString *) description {
    return [NSString stringWithFormat:@"(%@) (%@) (%@)", self.chore_done.name, self.person_who_did.person_name, self.when];
}
@end
