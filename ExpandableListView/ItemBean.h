//
//  ItemBean.h
//  FLJDemos
//
//  Created by chenlvmao on 16/3/10.
//  Copyright © 2016年 870828. All rights reserved.
//

#import <Foundation/Foundation.h>

enum StudentState {
    Online = 1,
    OffLine,
    LowPower
};

@interface ItemBean : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *no;
@property(nonatomic,copy) NSString *headImgPath;
@property(nonatomic,strong) NSURL *headImgUrl;
@property(nonatomic) enum StudentState *state;

@end
