//
//  ImagePreviewUtil.m
//  FLJDemos
//
//  Created by chenlvmao on 16/3/7.
//  Copyright © 2016年 870828. All rights reserved.
//
#import "ImagePreviewUtil.h"

@implementation ImagePreviewUtil
UIImageView *imageView;


+(void)previewImage:(UIImage *)image {
    if (imageView == nil) {
        CGRect mainFrame = [[UIScreen mainScreen] bounds];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        imageView = [[UIImageView alloc] initWithFrame:mainFrame];
        imageView.image = image;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor blackColor];
        [imageView addGestureRecognizer:tapGesture];
        imageView.userInteractionEnabled = YES;
    }
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:imageView];
}

+(void)handleTap:(UITapGestureRecognizer *)sender {
    [imageView removeFromSuperview];
    imageView = nil;
}
@end
