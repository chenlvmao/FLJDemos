//
//  ExpandableListViewController.m
//  FLJDemos
//
//  Created by chenlvmao on 16/3/10.
//  Copyright © 2016年 870828. All rights reserved.
//

#import "ExpandableListViewController.h"
#import "GroupBean.h"
#import "ItemBean.h"
#import "GroupTableView.h"
#import "ItemTableViewCell.h"

@interface ExpandableListViewController ()

@end

@implementation ExpandableListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backToUpControlView)];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(closeMagnifier)];
//    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(startMagnifier)];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    //[self.navigationItem setRightBarButtonItem:rightItem];
//    [self.navigationItem setRightBarButtonItems:@[rightItem, rightItem2]];
    self.title = @"花名册";

    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    [self addTestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addTestData{
    _dataArray = [[NSMutableArray alloc]init];
    GroupBean *groupBean = [[GroupBean alloc]init];
    ItemBean *itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211208";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211209";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211210";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"全班";
    groupBean.totalNum = 64;
    groupBean.onlineNum = 48;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"一组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = YES;
    [_dataArray addObject:groupBean];
    
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"二组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"三组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"四组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"五组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"六组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"七组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    groupBean = [[GroupBean alloc]init];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"李小峰";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211201";
    groupBean.items = [[NSMutableArray alloc]init];
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211202";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211203";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211204";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211205";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211206";
    [groupBean.items addObject:itemBean];
    itemBean = [[ItemBean alloc]init];
    itemBean.name = @"康素素";
    itemBean.headImgPath = @"head1.jpg";
    itemBean.no = @"41211207";
    [groupBean.items addObject:itemBean];
    groupBean.name = @"八组";
    groupBean.totalNum = 8;
    groupBean.onlineNum = 6;
    groupBean.expanded = NO;
    [_dataArray addObject:groupBean];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupBean *groupBean = _dataArray[section];
    
    //if (groupBean && groupBean.isExpanded) {
        return [groupBean.items count];
   // }
    //return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ItemTableViewCell" owner:self options:nil] lastObject];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell = [[ItemTableViewCell alloc]init];
    }
    
    ItemBean *item = [_dataArray[indexPath.section] items] [indexPath.row];
    cell.nameLabel.text = item.name;
    //cell.imageView.image = [UIImage imageNamed:item.headImgPath];
    cell.noLabel.text = item.no;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    GroupTableView *cell;// = [[GroupTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
//    cell.backgroundColor = [UIColor grayColor];
////    if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupTableView" owner:self options:nil] lastObject];
////        cell = [[GroupTableView alloc]init];
////    }
//    
    GroupBean *group = _dataArray[section];
    cell.backgroundColor = [UIColor grayColor];
    cell.nameLabel.text = group.name;
    cell.countLabel.text = [[NSString alloc]initWithFormat:@"%d/%d" ,group.onlineNum,group.totalNum];
    //cell.nameLabel.frame = CGRectMake(40, 11, 200, 28);
    //cell.nameLabel.textColor = [UIColor whiteColor];
//
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

@end
