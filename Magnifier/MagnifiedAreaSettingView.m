//
//  MagnifiedAreaSettingView.m
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import "MagnifiedAreaSettingView.h"

@interface MagnifiedAreaSettingView ()
@property CGPoint beganPosition;
@property CGPoint endedPosition;
@end

@implementation MagnifiedAreaSettingView

#pragma mark - UIView
-(id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] CGColor]);
    CGContextSetLineWidth(context, 2);
    CGPoint points[] = {_beganPosition, CGPointMake(_endedPosition.x, _beganPosition.y),_endedPosition, CGPointMake(_beganPosition.x, _endedPosition.y)};
    CGContextAddLines(context, points, 4);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

#pragma mark - Magnify Area 

-(CGRect)getMagnifyRect {
    CGRect rect = CGRectMake(MIN(_beganPosition.x, _endedPosition.x) , MIN(_beganPosition.y, _endedPosition.y), ABS(_beganPosition.x - _endedPosition.x), ABS(_beganPosition.y - _endedPosition.y));
    
    return rect;
}

#pragma mark - Touch Events

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    UITouch *touch = [touches anyObject];
    
    _beganPosition = [touch locationInView:self];
    [_delegate magnifyBegin:_beganPosition];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
    UITouch *touch = [touches anyObject];
    
    _endedPosition = [touch locationInView:self];
    [_delegate magnifying:_endedPosition];
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
    UITouch *touch = [touches anyObject];
    
    _endedPosition = [touch locationInView:self];
    [self performSelector:@selector(magnifyEnded) withObject:nil afterDelay:0.1f];
    
    [self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled");
    UITouch * touch = [touches anyObject];
    
    _endedPosition = [touch locationInView:self];
    
    [self performSelector:@selector(magnifyEnded) withObject:nil afterDelay:0.1f];
    [self setNeedsDisplay];
}

-(void) magnifyEnded {
    [_delegate magnifyEnded:_endedPosition];
}

@end
