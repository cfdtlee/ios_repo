//
//  ImageViewController.m
//  Imaginarium
//
//  Created by Eric on 1/8/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController()
@property (nonatomic, strong) UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;
@end

@implementation ImageViewController

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
}

@end
