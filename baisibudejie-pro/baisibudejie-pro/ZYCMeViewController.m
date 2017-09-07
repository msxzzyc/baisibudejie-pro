//
//  ZYCMeViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/9/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCMeViewController.h"

@interface ZYCMeViewController ()

@end

@implementation ZYCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我";
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithimage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)];
    
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithimage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:nil action:nil];
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}
- (void)settingButtonClick
{
    ZYCLogFuc;
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
