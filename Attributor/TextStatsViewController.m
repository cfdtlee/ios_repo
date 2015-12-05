//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Eric on 12/4/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colofulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end
@implementation TextStatsViewController

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidLoad];
//    self.textToAnalysze = [[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName : [UIColor greenColor], NSStrokeWidthAttributeName : @-3}];
//}

- (void)setTextToAnalysze:(NSAttributedString *)textToAnalysze {
    _textToAnalysze = textToAnalysze;
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI {
    self.colofulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName {
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    int index = 0;
    while (index < [self.textToAnalysze length]) {
        NSRange range;
        id value = [self.textToAnalysze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalysze attributedSubstringFromRange:range]];
            index = (int)(range.location + range.length);
        }
        else {
            index++;
        }
    }
    return characters;
}



@end
