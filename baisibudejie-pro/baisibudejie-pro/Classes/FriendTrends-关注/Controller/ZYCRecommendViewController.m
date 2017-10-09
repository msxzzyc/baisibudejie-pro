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
@interface ZYCRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;

@property(nonatomic,strong)NSArray *categories;
@end

@implementation ZYCRecommendViewController

static NSString *const ZYCCategoryId = @"category";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = ZYCGlobalBg;
    
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYCRecommenCategoryCell class]) bundle:nil] forCellReuseIdentifier:ZYCCategoryId];
    
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
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYCRecommenCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCCategoryId];
    cell.category = self.categories[indexPath.row];
    return cell;
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
