//
//  ImageViewController.m
//  Imaginarium
//
//  Created by Eric on 1/8/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController() <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation ImageViewController


- (void)setScrollView:(UIScrollView *)scrollView {
    // in case set scrollView content size was faild in setImage
    // when preparing segue, the view is not loaded
    _scrollView = scrollView;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.delegate = self;
    self.scrollView.contentSize = self.image ? self.image.size : self.image.size;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
//    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    [self startDownloadingImage];
}


// use another thread to download image
- (void)startDownloadingImage {
    [self.spinner startAnimating];
    self.image = nil;
    if (self.imageURL) {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configration = [NSURLSessionConfiguration ephemeralSessionConfiguration];//backgroundSessionConfigurationWithIdentifier
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configration];//if use background -- use delegate here
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable localfile, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                if ([request.URL isEqual:self.imageURL]) {
                    // make sure the image that user request is still the former url
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];// this is not happen in main queue
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.image = image; // this is happen in main queue
                    });
                    // [self performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO]; // this line is doing the same thing
                    
                    
                }
            }
        }];
        [task resume];
    }
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UIImage *)image {
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.scrollView.contentSize = self.image ? self.image.size : CGSizeZero;
    [self.spinner stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
}

@end
