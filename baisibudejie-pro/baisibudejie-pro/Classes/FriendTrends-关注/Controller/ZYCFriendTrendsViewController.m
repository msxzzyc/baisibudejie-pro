//
//  ZYCFriendTrendsViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/9/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCFriendTrendsViewController.h"

@interface ZYCFriendTrendsViewController ()

@end

@implementation ZYCFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(buttonClick)];
    
    self.view.backgroundColor = ZYCGlobalBg;
}
- (void)buttonClick
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
