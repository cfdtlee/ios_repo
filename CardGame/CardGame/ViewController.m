//
//  ViewController.m
//  CardGame
//
//  Created by Eric on 11/21/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "ViewController.h"
#import "deck.h"
@interface ViewController ()


// weak is because this label is held strongly by view itself, so we don't need to make it strong to keep it, the label will, if this label ever leaves the view it will get cleaned out from the heap, and this property, this pointer to it will get set to nil, which is exactly what we want, because if it is not in view, we don't want to sent message to it
// @property created by this process is weak because the MVC’s View already keeps a strong pointer to the UILabel, so there’s no need for the Controller to do so as well. And if the UILabel ever left the View, the Controller most likely wouldn’t want a pointer to it anyway (but if you did want to keep a pointer to it even if it left the View, you could change this to strong (very rare)).
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
// IBOutlet is a keyword Xcode puts here (similar to IBAction) to remind Xcode that this is not just a random @property, it's an outlet
@property (nonatomic) int flipCount;
@property (nonatomic) deck* realDeck;
@end

@implementation ViewController
@synthesize realDeck
-(void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount];
    NSLog(@"Flips: %d", self.flipCount);
}

// This method’s return type is actually, but Xcode uses the typedef IBAction instead just so that Xcode can keep track that this is not just a void random method that returns void, but rather, it’s an action method. Apart from that, IBAction is exactly the same thing as void.
- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed: @"cardback"]
                          forState: UIControlStateNormal];
        [sender setTitle: @""
                forState: UIControlStateNormal];
    }
    else {
        [sender setBackgroundImage: [UIImage imageNamed: @"cardfront"]
                          forState: UIControlStateNormal];
        [sender setTitle: @"A♣️"
                forState: UIControlStateNormal];
    }
    NSLog([realDeck drawRandomCard].contents);
    self.flipCount++;
}


// IBAction is actually typedef of void, in case of generating a target

@end
