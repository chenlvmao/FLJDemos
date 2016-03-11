//
//  FLJDemoListTableViewController.m
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import "FLJDemoListTableViewController.h"
#import "MagnifierViewController.h"
#import "FLJNavigationController.h"
#import "ExpandableListViewController.h"
#import "ImagePreviewUtil.h"

@interface FLJDemoListTableViewController ()

@end

@implementation FLJDemoListTableViewController

#pragma mark - view controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.demoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void) loadInitialData {
    [self.demoItems addObject:@"放大镜"];
    [self.demoItems addObject:@"图片预览"];
    [self.demoItems addObject:@"多级列表"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.demoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"demoCellIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.demoItems objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view selection

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"进入:《%@》功能",[self.demoItems objectAtIndex:indexPath.row]);
    NSString *title = [self.demoItems objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        [self magnifier:title];
    } else if (indexPath.row == 1) {
        UIImage *image = [UIImage imageNamed:@"magnifier.jpg"];
        [ImagePreviewUtil previewImage:image];
    } else if (indexPath.row == 2) {
        [self openExpandableListView:title];
    }
    
}

#pragma mark - Demo Items

-(void) magnifier:(NSString*) title {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Magnifier" bundle:[NSBundle mainBundle]];
    MagnifierViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"MagnifierViewController"];
    FLJNavigationController *navigationController = [[FLJNavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

-(void)openExpandableListView:(NSString *)title{
    ExpandableListViewController *viewController = [[ExpandableListViewController alloc]init];
    FLJNavigationController *navigationController = [[FLJNavigationController alloc]initWithRootViewController:viewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

@end
