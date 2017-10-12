//
//  ZYCRecommendViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/3.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCRecommendViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "ZYCRecommenCategoryCell.h"
#import "ZYCRecommendCategory.h"
#import "ZYCRecommendUserCell.h"
#import "ZYCRecommendUser.h"
@interface ZYCRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@property(nonatomic,strong)NSArray *categories;
@property(nonatomic,strong)NSArray *users;
@end

@implementation ZYCRecommendViewController

static NSString *const ZYCCategoryId = @"category";
static NSString *const ZYCUserId = @"user";

- (void)setUpTableView
{
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYCRecommenCategoryCell class]) bundle:nil] forCellReuseIdentifier:ZYCCategoryId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYCRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:ZYCUserId];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70;
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = ZYCGlobalBg;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        ZYCLog(@"%@",responseObject);
        self.categories = [ZYCRecommendCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoryTableView reloadData];
        
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败！"];
    }];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) {
        return self.categories.count;
    }else{
        
        ZYCRecommendCategory *category =  self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        return category.users.count;
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        ZYCRecommenCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCCategoryId];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else{
        ZYCRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCUserId];
        ZYCRecommendCategory *category =  self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        cell.user = category.users[indexPath.row];
        return cell; 
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYCRecommendCategory *category = self.categories[indexPath.row];
    if (category.users.count) {
        [self.userTableView reloadData];
    } else {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @([category id]);
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.users =[ZYCRecommendUser objectArrayWithKeyValuesArray: responseObject[@"list"]];
        [category.users addObjectsFromArray:self.users];
        [self.userTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYCLog(@"%@",error);
        
    }];
        
    }
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
