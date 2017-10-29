//
//  ZYCEssenceViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/9/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCEssenceViewController.h"
#import "ZYCRecommendTagsViewController.h"
@interface ZYCEssenceViewController ()
@property(weak,nonatomic)UIView *indicator;
@end

@implementation ZYCEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    [self setTitleView];
    
    self.view.backgroundColor = ZYCGlobalBg;

}
- (void)setTitleView
{
    UIView *titleView = [[UIView alloc]init];
    titleView.width = self.view.width;
    titleView.height = 35;
    titleView.y = 64;
    
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    
    [self.view addSubview:titleView];
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSInteger count = 5;
    
    CGFloat width = titleView.width/titles.count;
    CGFloat height = titleView.height;
    for (NSInteger i = 0; i<count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.width = width;
        button.height = height;
        button.x = i*width;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
    }
    UIView *indicator = [[UIView alloc]init];
    indicator.backgroundColor = [UIColor redColor];
    indicator.height = 2;
    indicator.y = titleView.height - indicator.height;
    [titleView addSubview:indicator];
    self.indicator = indicator;
}
- (void)titleClick:(UIButton *)button
{
    [UIView animateWithDuration:0.25 animations:^{
        self.indicator.centerX = button.centerX;
        self.indicator.width = button.titleLabel.width;
    }];
    
    ZYCLogFuc;
}
- (void)setNav
{
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(essencebuttonClick)];
}
- (void)essencebuttonClick
{
    ZYCRecommendTagsViewController *tagsVc = [[ZYCRecommendTagsViewController alloc]init];
    [self.navigationController pushViewController:tagsVc animated:YES];
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
