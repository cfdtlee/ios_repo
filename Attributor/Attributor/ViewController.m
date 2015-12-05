//
//  ViewController.m
//  Attributor
//
//  Created by Eric on 12/2/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Analyze Text"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalysze = self.body.textStorage;
        }
    }
}

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
    
}

- (IBAction)OutlineBodySelection:(UIButton *)sender {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName : @-3,
                                           NSStrokeColorAttributeName : [UIColor blackColor]}
                                  range:self.body.selectedRange];
}

- (IBAction)UnoutlineBodySelection:(UIButton *)sender {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName : @3,
                           NSStrokeColorAttributeName : self.outlineButton.tintColor}
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
     
}


@end
