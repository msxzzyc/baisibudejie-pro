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
#import <MJRefresh.h>
#define ZYCSelectedCategory self.categories[self.categoryTableView.indexPathForSelectedRow.row]
@interface ZYCRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@property(strong,nonatomic)NSMutableDictionary *params;
@property(nonatomic,strong)NSArray *categories;
@property(nonatomic,strong)AFHTTPSessionManager *manager;

@end

@implementation ZYCRecommendViewController

static NSString *const ZYCCategoryId = @"category";
static NSString *const ZYCUserId = @"user";

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    [self setUpRefresh];
    [self loadCategories];
    
}
- (void)loadCategories
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        ZYCLog(@"%@",responseObject);
        self.categories = [ZYCRecommendCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoryTableView reloadData];
        
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败！"];
    }];
}
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

- (void)setUpRefresh
{
    self.userTableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.userTableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
}

- (void)loadMoreUsers
{
    ZYCRecommendCategory *c =  ZYCSelectedCategory;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(c.id);
    params[@"page"] = @(++c.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (params != self.params) return ;
        
        NSArray *users =[ZYCRecommendUser objectArrayWithKeyValuesArray: responseObject[@"list"]];
        
        [c.users addObjectsFromArray:users];
        [self.userTableView reloadData];
        
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYCLog(@"%@",error);
        if (params != self.params) return ;
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败！"];
        [self.userTableView.mj_footer endRefreshing];
        
    }];
   
}

- (void)loadNewUsers
{
    ZYCRecommendCategory *rc = ZYCSelectedCategory;
    rc.currentPage = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(rc.id);
    params[@"page"] = @(rc.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (params != self.params) return ;
        NSArray *users =[ZYCRecommendUser objectArrayWithKeyValuesArray: responseObject[@"list"]];
        [rc.users removeAllObjects];
        [rc.users addObjectsFromArray:users];
        rc.total = [responseObject[@"total"] integerValue];
        [self.userTableView reloadData];
        
        [self.userTableView.mj_header endRefreshing];

        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYCLog(@"%@",error);
        if (params != self.params) return ;
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败！"];
        [self.userTableView.mj_header endRefreshing];
    }];
  
}

- (void)checkFooterState
{
    ZYCRecommendCategory *rc = ZYCSelectedCategory;
    self.userTableView.mj_footer.hidden = (rc.users.count == 0);
    if (rc.count == rc.total) {
        [self.userTableView.mj_footer noticeNoMoreData];
    }else{
        [self.userTableView.mj_footer endRefreshing];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) return self.categories.count;
    
    [self checkFooterState];
    return [ZYCSelectedCategory users].count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        ZYCRecommenCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCCategoryId];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else{
        
        ZYCRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCUserId];
        ZYCRecommendCategory *category =  ZYCSelectedCategory;
        cell.user = category.users[indexPath.row];
        return cell; 
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    ZYCRecommendCategory *category = self.categories[indexPath.row];
    if (category.users.count) {
        [self.userTableView reloadData];
    } else {
        [self.userTableView reloadData];
    
        [self.userTableView.mj_header beginRefreshing];
    }
}
- (void)dealloc
{
    [self.manager.operationQueue cancelAllOperations];
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
