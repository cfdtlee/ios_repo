//
//  ViewController.m
//  Imaginarium
//
//  Created by Eric on 1/8/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        NSLog(@"dsg");
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/%@.jpg", segue.identifier]];

        ivc.title = segue.identifier;
    }
}

@end
