//
//  GroupBean.h
//  FLJDemos
//
//  Created by chenlvmao on 16/3/10.
//  Copyright © 2016年 870828. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBean : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic) int totalNum;
@property(nonatomic) int onlineNum;

@property(nonatomic,getter=isExpanded) BOOL expanded;
@property(nonatomic,strong) NSMutableArray *items;

@end
