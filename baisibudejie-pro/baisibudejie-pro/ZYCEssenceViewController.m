//
//  ZYCEssenceViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/9/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCEssenceViewController.h"

@interface ZYCEssenceViewController ()

@end

@implementation ZYCEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    UIButton *essencebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [essencebutton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [essencebutton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    essencebutton.size = essencebutton.currentBackgroundImage.size;
    [essencebutton addTarget:self action:@selector(essencebuttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:essencebutton];
    
    

}

- (void)essencebuttonClick
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
