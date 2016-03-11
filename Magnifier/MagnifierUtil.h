//
//  MagnifierUtil.h
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MagnifiedAreaSettingView.h"

@interface MagnifierUtil : NSObject <MagnifiedAreaSettingDelegate>
@property UIView *container;
@property UIView *toMagnifyView;
@property MagnifiedAreaSettingView *settingView;
@property BOOL opening;

/**
 *  初始化
 *
 *  @param container 容器
 *
 *  @return 实例
 */
-(id)initWithContainer:(UIView *) container;
/**
 *  启动放大器
 */
-(void)startMagnifier;
/**
 *  关闭放大器
 */
-(void)closeMagnifier;

@end
