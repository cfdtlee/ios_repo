//
//  BezierPathView.m
//  Dropit
//
//  Created by Eric on 1/7/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (void)setPath:(UIBezierPath *)path {
    _path = path;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}
@end
