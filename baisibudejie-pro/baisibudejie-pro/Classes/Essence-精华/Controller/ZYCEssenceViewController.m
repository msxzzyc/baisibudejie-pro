//
//  ZYCEssenceViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/9/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCEssenceViewController.h"
#import "ZYCRecommendTagsViewController.h"
#import "ZYCAllViewController.h"
#import "ZYCVideoViewController.h"
#import "ZYCVoiceViewController.h"
#import "ZYCPictureViewController.h"
#import "ZYCWordViewController.h"
@interface ZYCEssenceViewController ()<UIScrollViewDelegate>
@property(weak,nonatomic)UIView *indicator;
@property(weak,nonatomic)UIButton *selectedButton;
@property(weak,nonatomic)UIView *titleView;
@property(weak,nonatomic)UIScrollView *contentView;
@end

@implementation ZYCEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setNav];
    [self setUpChildVces];
    
    [self setTitleView];
    
    [self setContentView];
    
    
    self.view.backgroundColor = ZYCGlobalBg;

    
}
- (void)setTitleView
{
    UIView *titleView = [[UIView alloc]init];
    titleView.width = self.view.width;
    titleView.height = 35;
    titleView.y = 64;
    
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.titleView = titleView;
    [self.view addSubview:titleView];
    UIView *indicator = [[UIView alloc]init];
    indicator.backgroundColor = [UIColor redColor];
    indicator.height = 2;
    indicator.y = titleView.height - indicator.height;
    
    self.indicator = indicator;
    
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat width = titleView.width/titles.count;
    CGFloat height = titleView.height;
    for (NSInteger i = 0; i<titles.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.width = width;
        button.height = height;
        button.x = i*width;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.tag = i;
        [button layoutIfNeeded];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
        
        if ( i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
//            [button.titleLabel sizeToFit];
            
//            self.indicator.width = button.titleLabel.width;
            self.indicator.width = [titles[i] sizeWithAttributes:@{NSFontAttributeName : button.titleLabel.font}].width;
            self.indicator.centerX = button.centerX;
            
        }
        [titleView addSubview:indicator];
    }
    
    
}
- (void)titleClick:(UIButton *)button
{
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    [UIView animateWithDuration:0.25 animations:^{
        self.indicator.centerX = button.centerX;
        self.indicator.width = button.titleLabel.width;
        
    }];
    CGPoint offSet = self.contentView.contentOffset;
    offSet.x = button.tag *self.contentView.width;
    [self.contentView setContentOffset:offSet animated:YES];
    ZYCLogFuc;
}

- (void)setContentView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;

    [self.view insertSubview:contentView atIndex:0];
    self.contentView = contentView;
    self.contentView.contentSize = CGSizeMake(contentView.width *self.childViewControllers.count, 0);
    [self scrollViewDidEndScrollingAnimation:contentView];
}
- (void)setUpChildVces
{
    ZYCAllViewController *all = [[ZYCAllViewController alloc]init];
    [self addChildViewController:all];
    
    ZYCVideoViewController *video = [[ZYCVideoViewController alloc]init];
    [self addChildViewController:video];
    
    ZYCVoiceViewController *voice = [[ZYCVoiceViewController alloc]init];
    [self addChildViewController:voice];
    
    ZYCPictureViewController *picture = [[ZYCPictureViewController alloc]init];
    [self addChildViewController:picture];
    
    ZYCWordViewController *word = [[ZYCWordViewController alloc]init];
    [self addChildViewController:word];
    
    
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

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    
    UITableViewController *vc = self.childViewControllers[index];
    vc.tableView.x = scrollView.contentOffset.x;
    vc.tableView.y = 0;
    vc.tableView.height = scrollView.height;
    CGFloat top = CGRectGetMaxY(self.titleView.frame);
    CGFloat bottom = self.tabBarController.tabBar.height;
    
    vc.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    vc.tableView.scrollIndicatorInsets = vc.tableView.contentInset;
    [scrollView addSubview:vc.view];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    [self titleClick:self.titleView.subviews[index]];
    
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
