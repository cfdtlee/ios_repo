//
//  PersonMO.m
//  coredata_ios_essential
//
//  Created by Eric on 1/2/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "PersonMO.h"
#import "ChoreLogMO.h"

@implementation PersonMO

// Insert code here to add functionality to your managed object subclass
- (NSString *)description
{
    return self.person_name;
}
@end
