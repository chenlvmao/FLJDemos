//
//  MagnifierView.m
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import "MagnifierView.h"

const CGFloat MaxMagnifyScale = 3;

@interface MagnifierView()
@property CGFloat magnifyScale;

@end

@implementation MagnifierView

#pragma mark - UIView

-(id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.layer.backgroundColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] CGColor];
        _magnifyScale = MaxMagnifyScale;
    }
    
    return self;
}

#pragma mark - Magnify View

-(CGFloat) calcMagnifyScale {
    CGFloat scale = 0;
    CGFloat maxWidth = self.frame.size.width;
    CGFloat maxHeight = self.frame.size.height;
    CGFloat widthScale = maxWidth / _magnifyImage.size.width;
    CGFloat heightScale = maxHeight / _magnifyImage.size.height;
    
    scale = MIN(widthScale, heightScale);
    scale = MIN(scale, MaxMagnifyScale);
    return scale;
}

-(void) addMagnifyView {
    CGRect frame = CGRectMake(self.frame.size.width / 2 - _magnifyImage.size.width / 2, self.frame.size.height / 2 - _magnifyImage.size.height / 2, _magnifyImage.size.width, _magnifyImage.size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:_magnifyImage];
    [self addSubview:imageView];
    
    _magnifyScale = [self calcMagnifyScale];
    CGAffineTransform transform = CGAffineTransformMakeScale(_magnifyScale, _magnifyScale);
    imageView.transform = transform;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [imageView addGestureRecognizer:pan];
    imageView.userInteractionEnabled = YES;
}

-(void)panGesture:(UIPanGestureRecognizer *)sender {
    NSLog(@"拖动图片");
    CGPoint point = [sender translationInView:self];
    sender.view.center = CGPointMake(point.x + sender.view.center.x, point.y + sender.view.center.y);
    [sender setTranslation:CGPointZero inView:self];
    
    if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"图片恢复原位");
        CGAffineTransform transform = CGAffineTransformMakeScale(_magnifyScale, _magnifyScale);
        sender.view.transform = transform;
        sender.view.center = self.center;
    }
}

@end
