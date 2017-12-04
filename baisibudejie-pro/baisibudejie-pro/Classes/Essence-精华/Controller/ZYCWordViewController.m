//
//  ZYCWordViewController.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/31.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCWordViewController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "ZYCTopic.h"
#import "ZYCTopicCell.h"
#import <MJExtension.h>
#import <MJRefresh.h>
@interface ZYCWordViewController ()
@property(nonatomic,strong)NSMutableArray *topics;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSString *maxtime;
@property(nonatomic,strong)NSDictionary *params;
@end

@implementation ZYCWordViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self setRefresh];
    
}
static NSString *const ZYCTopicCellId = @"topic";
- (void)setUpTableView
{
    CGFloat top = ZYCTitlesViewY + ZYCTitlesViewH;
    CGFloat bottom = self.tabBarController.tabBar.height;
    
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYCTopicCell class]) bundle:nil] forCellReuseIdentifier:ZYCTopicCellId];
    
}
- (NSMutableArray *)topics
{
    if (!_topics) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)setRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopic)];
    
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopic)];
    
//    self.tableView.mj_footer.hidden = YES;
}
- (void)loadNewTopic
{
    [self.tableView.mj_footer endRefreshing];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    self.params = params;
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params !=params) return ;
        //        ZYCLog(@"%@",responseObject);
        self.maxtime = responseObject[@"info"][@"maxtime"];
        self.topics = [ZYCTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //        [responseObject writeToFile:@"/Users/zyc/Desktop/duanzi.plist" atomically:YES];
        
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
        self.page = 0;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params !=params) return ;
        ZYCLog(@"%@",error);
        [self.tableView.mj_header endRefreshing];
        
        
        
    }];
}

- (void)loadMoreTopic
{
    [self.tableView.mj_header endRefreshing];
//    self.page++;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    NSInteger page = self.page + 1;
    params[@"page"] = @(page);
    params[@"maxtime"] = self.maxtime;
    self.params = params;
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params !=params) return ;
        //        ZYCLog(@"%@",responseObject);
        self.maxtime = responseObject[@"info"][@"maxtime"];
        NSArray *newTopics = [ZYCTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //        [responseObject writeToFile:@"/Users/zyc/Desktop/duanzi.plist" atomically:YES];
        [self.topics addObjectsFromArray:newTopics];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
        
        self.page = page;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYCLog(@"%@",error);
        if (self.params !=params) return ;
//        self.page--;
        [self.tableView.mj_footer endRefreshing];
        
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.tableView.mj_footer.hidden = (self.topics.count == 0);
    
    return self.topics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    ZYCTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCTopicCellId];
    
    cell.topic = self.topics[indexPath.row];

    return cell;
}
#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
