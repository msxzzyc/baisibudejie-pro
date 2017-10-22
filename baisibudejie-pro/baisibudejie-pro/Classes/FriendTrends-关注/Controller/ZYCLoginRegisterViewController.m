//
//  ZYCLoginRegisterViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/21.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCLoginRegisterViewController.h"

@interface ZYCLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;

@end

@implementation ZYCLoginRegisterViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showLoginOrRegister:(UIButton *)button {
    [self.view endEditing:YES];
    
    if (self.loginViewLeftMargin.constant == 0) {
//        button.selected = YES;
        [button setTitle:@"已有账号？" forState:UIControlStateNormal];
        self.loginViewLeftMargin.constant = -self.view.width;
    } else {
                button.selected = NO ;
        [button setTitle:@"注册账号" forState:UIControlStateNormal];
        self.loginViewLeftMargin.constant = 0;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
//    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    NSAttributedString *placeholder = [[NSAttributedString alloc]initWithString:@"手机号" attributes:attr];
//    self.phoneField.attributedPlaceholder = placeholder;
    
//    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:@"手机号"];
//    [placeholder setAttributes:@{
//        NSForegroundColorAttributeName : [UIColor whiteColor]} range:NSMakeRange(0, 1)];
//    [placeholder setAttributes:@{
//                                 NSForegroundColorAttributeName : [UIColor greenColor]} range:NSMakeRange(1, 1)];
//    [placeholder setAttributes:@{
//                                 NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(2, 1)];
//    self.phoneField.attributedPlaceholder = placeholder;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
