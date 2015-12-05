//
//  ViewController.m
//  CardGame
//
//  Created by Eric on 11/21/15.
//  Copyright (c) 2015 Eric. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
@interface ViewController ()

// Outlet Collection arrays are always strong While the View will point strong, so Xcode has removed that option from the dialog. While the view will point strongly to all of the buttons inside the array, it will not point to the array itself at all(only our Controller will) so our outlet needs to be strongly held in the heap by our Controller.
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
// This is now an NSArray which contains all UIButtons you connected in random order. This ramdomness is okay for our purposes because the order of these cards will mean nothing to our matching game. It is something to consider though if you are developing an app where the order does matter (in that case, an outlet collection may not be what you want).


// weak is because this label is held strongly by view itself, so we don't need to make it strong to keep it, the label will, if this label ever leaves the view it will get cleaned out from the heap, and this property, this pointer to it will get set to nil, which is exactly what we want, because if it is not in view, we don't want to sent message to it
// @property created by this process is weak because the MVC’s View already keeps a strong pointer to the UILabel, so there’s no need for the Controller to do so as well. And if the UILabel ever left the View, the Controller most likely wouldn’t want a pointer to it anyway (but if you did want to keep a pointer to it even if it left the View, you could change this to strong (very rare)).
// @property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
// IBOutlet is a keyword Xcode puts here (similar to IBAction) to remind Xcode that this is not just a random @property, it's an outlet
// @property (nonatomic) int flipCount;
// @property (nonatomic) PlayingCardDeck* realDeck;
// @property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

-(CardMatchingGame*) game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
        
    }
    return _game;
}

- (IBAction)redeal:(UIButton *)sender {
    [_game redealWithCardCount:[self.cardButtons count]
                     usingDeck:[self createDeck]];
    [self updateUI];
}

- (IBAction)changeMode:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == 0) {
        
    }
}

//-(Deck *)deck {
//    if(!_deck) {
//        _deck = [self createDeck];
//    }
//    return _deck;
//}

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}


//-(void) setFlipCount:(int)flipCount{
//    _flipCount = flipCount;
//    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount];
//    NSLog(@"Flips: %d", self.flipCount);
//}

// This method’s return type is actually, but Xcode uses the typedef IBAction instead just so that Xcode can keep track that this is not just a void random method that returns void, but rather, it’s an action method. Apart from that, IBAction is exactly the same thing as void.
- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger choseButtonIndex = [self.cardButtons indexOfObject: sender];
    [self.game chooseCardAtIndex: choseButtonIndex];
    [self updateUI];
}



-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex: cardButtonIndex];
        [cardButton setTitle: [self titleForCard: card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
    }
}

-(NSString *)titleForCard:(Card *) card {
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *) card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

// IBAction is actually typedef of void, in case of generating a target

@end
