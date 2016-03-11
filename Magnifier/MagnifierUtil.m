//
//  MagnifierUtil.m
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import "MagnifierUtil.h"
#import "MagnifierView.h"

@interface MagnifierUtil ()
@property UIImage *magnifyImage;
@property MagnifierView *magnifierView;
@property UILabel *tipLabel;

@end

@implementation MagnifierUtil

-(id) initWithContainer:(UIView *)container {
    self = [super init];
    
    if (self) {
        _container = container;
    }
    
    return self;
}

- (void) setMagnifyImage {
    if (_settingView == nil) {
        return;
    }
    
    CGRect rect = [_settingView getMagnifyRect];
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(context, true);
    CGContextSetAllowsAntialiasing(context, true);
    //CGContextSetLineCap(context, CGLineCap);
    CGContextTranslateCTM(context, -1*rect.origin.x, -1*rect.origin.y);
    [_container.layer renderInContext:context];
    _magnifyImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self removeMagnifiedAreaSettingView];
}

-(void) addMagnifyView {
    if (_magnifierView == nil) {
        _magnifierView = [[MagnifierView alloc] initWithFrame:_container.frame];
        _magnifierView.magnifyImage = _magnifyImage;
        [_magnifierView addMagnifyView];
        
        [_container addSubview:_magnifierView];
    }
}

-(void) removeMagnifyView {
    if (_magnifierView != nil) {
        [_magnifierView removeFromSuperview];
        _magnifyImage = nil;
        _magnifierView = nil;
    }
}

-(void)startMagnifier {
    [self addMagnifiedAreaSettingView];
    [self addTipView];
}

-(void)closeMagnifier {
    [self removeMagnifyView];
    [self removeMagnifiedAreaSettingView];
    _magnifyImage = nil;
}

#pragma mark - MagnifiedAreaSettingView

-(void)addTipView {
    if (_tipLabel == nil) {
        CGFloat width = 180;
        CGFloat height = 40;
        CGRect frame = CGRectMake(_container.frame.size.width / 2 - width / 2, _container.frame.size.height / 2 - height / 2, width, height);
        _tipLabel = [[UILabel alloc] initWithFrame:frame];
        _tipLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        _tipLabel.text = @"点击任意位置拖动选择放大区域";
        _tipLabel.font = [UIFont systemFontOfSize:10];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.textColor = [UIColor whiteColor];
    }
    
    [_container addSubview:_tipLabel];
}

-(void)removeTipView {
    if (_tipLabel != nil) {
        [_tipLabel removeFromSuperview];
        _tipLabel = nil;
    }
}

-(void) addMagnifiedAreaSettingView {
    if (_settingView == nil) {
        _settingView = [[MagnifiedAreaSettingView alloc] initWithFrame:_container.frame];
        _settingView.delegate = self;
    }
    
    [_container addSubview:_settingView];
}

-(void)removeMagnifiedAreaSettingView {
    if (_settingView != nil) {
        [_settingView removeFromSuperview];
        _settingView = nil;
    }
}

#pragma mark - MagnifiedAreaSettingDelegate

-(void) magnifyBegin:(CGPoint)position {
    NSLog(@"开始设置放大区域：(x=%f; y=%f)", position.x, position.y);
    [self removeTipView];
}

-(void) magnifying:(CGPoint)position {
    NSLog(@"修改放大区域中：(x=%f; y=%f)", position.x, position.y);
    
}

-(void) magnifyEnded:(CGPoint)position {
    NSLog(@"放大区域设置完成：(x=%f; y=%f)", position.x, position.y);
    [self setMagnifyImage];
    [self addMagnifyView];
}

@end
