//
//  MagnifierView.h
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagnifiedAreaSettingView.h"

@interface MagnifierView : UIView
@property UIImage *magnifyImage;

/**
 *  添加放大器视图
 */
-(void)addMagnifyView;

@end
