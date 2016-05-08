//
//  BNRHypnsisView.m
//  Hypnosister
//
//  Created by Eric on 5/6/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "BNRHypnsisView.h"

@interface BNRHypnsisView()

@property(strong, nonatomic) UIColor *circleColor;

@end


@implementation BNRHypnsisView



-(instancetype)initWithFrame:(CGRect)frame
{
//    self.userInteractionEnabled = NO;
    NSLog(@"%d",self.userInteractionEnabled);

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.width);
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0 endAngle:M_PI * 2
                     clockwise:YES];
    }
    path.lineWidth = 10;
//    [[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    [path stroke];
    
    // shadow
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo"];
    [logoImage drawInRect:CGRectMake(10, 20, 30, 30)];
    
    // Generate each triangle path points
    // I'm using the variable center to create the triangle points

    
    // Glue the points with a UIBezierPath instance
    UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
    [trianglePath moveToPoint:CGPointMake(center.x, center.y - 100)];
    [trianglePath addLineToPoint:CGPointMake(center.x+100, center.y+150)];
    [trianglePath addLineToPoint:CGPointMake(center.x-100, center.y+150)];
    [trianglePath closePath];
    // Save the state of the current graphics context

    
    // Draw the triangle!
    [trianglePath addClip];
//    [trianglePath fill];
    
    CGFloat location[2] = {0.0, 1.0};
    CGFloat componens[8] = {1.0, 0.0, 0.0, 1.0,
        1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, componens, location, 2);

    CGPoint startPoint = CGPointMake(0, center.y - 100); // Gradient start point
    CGPoint endPoint  = CGPointMake(0, center.y + 150);   // Gradient end point
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    CGContextRestoreGState(currentContext);

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if ([touch view]) {
        NSLog(@"sdg");
    }
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    self.circleColor = randomColor;
}

-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"nslog");
//    NSLog(@"%@ was touched", self);
//    
//    float red = (arc4random() % 100)/100;
//    float green = (arc4random() % 100)/100;
//    float blue = (arc4random() % 100)/100;
//    
//    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
//    
//    self.circleColor = randomColor;
//}

@end

