//
//  ViewController.m
//  TwitterShareApp
//
//  Created by Eric on 12/14/15.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "ViewController.h"
#import "social/social.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

- (void)configureTweetTextView;
- (void)showAlertmessage:(NSString *) myMessage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureTweetTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertmessage:(NSString *) myMessage {
    UIAlertController *alertController;
    alertController = [UIAlertController alertControllerWithTitle:@"Social Share" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"okay" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)showShareAction:(UIBarButtonItem *)sender {
    if ([self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    }
    
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"share" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:nil];

    UIAlertAction *tweetAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:
                                  ^(UIAlertAction *action) {
                                      if ([SLComposeViewController
                                           isAvailableForServiceType:SLServiceTypeTwitter]) {
                                          //tweet out the tweet
                                          SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                                          if ([self.tweetTextView.text length] < 140) {
                                              [twitterVC setInitialText:self.tweetTextView.text];
                                          }
                                          else {
                                              [twitterVC setInitialText:[self.tweetTextView.text substringToIndex:140]];
                                          }
                                          [self presentViewController:twitterVC animated:YES completion:nil];
                                      }
                                      else {
                                          //raise some kind of objection
                                          [self showAlertmessage:@"please sign in twitter before tweet"];
                                      }
                                  }];
    
    UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:@"Post to facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [facebookVC setInitialText:self.tweetTextView.text];
            [self presentViewController:facebookVC animated:YES completion:nil];
        }
        else {
            [self showAlertmessage:@"please sign in facebook"];
        }
    }];
    
    // smart controller, if you pass it text, it only show you options that are relevant for text, if you pass picture, it will only show you elements that are pictures
    UIAlertAction *moreAction = [UIAlertAction actionWithTitle:@"more"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
                                                           UIActivityViewController *moreVC = [[UIActivityViewController alloc]initWithActivityItems:@[self.tweetTextView.text] applicationActivities:nil];
                                                           [self presentViewController:moreVC animated:YES completion:nil];
    }];
    
    [actionController addAction:tweetAction];
    [actionController addAction:facebookAction];
    [actionController addAction:moreAction];
    [actionController addAction:cancelAction];
    
    [self presentViewController:actionController animated:YES completion:nil];
}

- (void)configureTweetTextView {
    self.tweetTextView.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.tweetTextView.layer.borderWidth = 2.0;
    
}

@end
