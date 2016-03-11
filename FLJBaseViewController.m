//
//  FLJBaseViewController.m
//  FLJDemos
//
//  Created by 870828 on 16/3/2.
//  Copyright © 2016年 870828. All rights reserved.
//

#import "FLJBaseViewController.h"

@interface FLJBaseViewController ()

@end

@implementation FLJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backToUpControlView {
    NSArray *ctrlArray = self.navigationController.viewControllers;
    NSInteger count = [ctrlArray count];
    NSInteger upPosition = 0;
    if (count > 1) {
        upPosition = count -2;
    } else if (count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    [self.navigationController popToViewController:[ctrlArray objectAtIndex:upPosition] animated:YES];
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
