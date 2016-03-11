//
//  MagnifierViewController.m
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import "MagnifierViewController.h"
#import "MagnifiedAreaSettingView.h"

@interface MagnifierViewController ()

@end

@implementation MagnifierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
//    //[leftButton setImage:[UIImage imageNamed:@"arrow_left"] forState:UIControlStateNormal];
//    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
//    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(backToUpControlView) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    [self.navigationItem setLeftBarButtonItem:leftItem];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backToUpControlView)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(closeMagnifier)];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(startMagnifier)];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    //[self.navigationItem setRightBarButtonItem:rightItem];
    [self.navigationItem setRightBarButtonItems:@[rightItem, rightItem2]];
    self.title = @"放大镜";
    
    _magnifierUtil = [[MagnifierUtil alloc] initWithContainer:self.view];
    [self startMagnifier];
    
//    MagnifiedAreaSettingView *settingView = [[MagnifiedAreaSettingView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:settingView];
}

-(void)startMagnifier {
    [_magnifierUtil startMagnifier];
}

-(void)closeMagnifier {
    [_magnifierUtil closeMagnifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
