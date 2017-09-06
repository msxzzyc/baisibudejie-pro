//
//  ZYCTabBarController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/9/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCTabBarController.h"
#import <Foundation/Foundation.h>
@interface ZYCTabBarController ()

@end

@implementation ZYCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    UIViewController *vc01 = [[UIViewController alloc]init];
    vc01.title = @"精华";
    vc01.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    vc01.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    vc01.view.backgroundColor = [UIColor redColor];
    [vc01.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc01.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateSelected];
    [self addChildViewController:vc01];
    
    UIViewController *vc02 = [[UIViewController alloc]init];
    vc02.view.backgroundColor = [UIColor greenColor];
    vc02.title = @"新帖";
    vc02.tabBarItem.image =[UIImage imageNamed:@"tabBar_new_icon"];
    vc02.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    
    [self addChildViewController:vc02];
    
    UIViewController *vc03 = [[UIViewController alloc]init];
    vc03.view.backgroundColor = [UIColor grayColor];
    vc03.title = @"关注";
    vc03.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    vc03.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    
    [self addChildViewController:vc03];
    
    UIViewController *vc04 = [[UIViewController alloc]init];
    vc04.view.backgroundColor = [UIColor blueColor];
    vc04.view.backgroundColor = [UIColor grayColor];
    vc04.title = @"我";
    vc04.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    vc04.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    
    
    
    [self addChildViewController:vc04];
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
