//
//  ExpandableListViewController.h
//  FLJDemos
//
//  Created by chenlvmao on 16/3/10.
//  Copyright © 2016年 870828. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLJBaseViewController.h"

@interface ExpandableListViewController : FLJBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView *tableView;
@property (nonatomic) NSMutableArray *dataArray;

@end
