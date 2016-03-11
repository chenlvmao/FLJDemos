//
//  MagnifiedAreaSettingView.h
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MagnifiedAreaSettingDelegate
/**
 *  开始设置位置
 *
 *  @param position 开始放大的位置
 */
-(void)magnifyBegin:(CGPoint) position;
/**
 *  设置位置中
 *
 *  @param position 当前设置的结束位置
 */
-(void)magnifying:(CGPoint) position;
/**
 *  设置位置结束
 *
 *  @param position 最终的结束位置
 */
-(void)magnifyEnded:(CGPoint) position;

@end

@interface MagnifiedAreaSettingView : UIView
@property UIView *viewToMagnify;
@property (nonatomic, weak) id <MagnifiedAreaSettingDelegate> delegate;

/**
 *  获取放大区域
 *
 *  @return 放大区域
 */
-(CGRect) getMagnifyRect;
@end
