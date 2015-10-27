//
//  YYAllViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYAllViewController.h"
#import "YYTopic.h"
#import "YYTopicCell.h"
#import <MJExtension.h>
#import "YYHTTPSessionManager.h"
#import <MJRefresh.h>



@interface YYAllViewController ()

@property (nonatomic, weak) YYHTTPSessionManager *manager;

@property (nonatomic, strong) NSMutableArray<YYTopic *> *topics;

@property (nonatomic, copy) NSString *maxtime;

@end

@implementation YYAllViewController

static NSString *const YYTopicCellId = @"topic";

- (YYHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [YYHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //内边距
    self.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
//    self.tableView.rowHeight = 400;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = YYCommonBgColor;
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYTopicCell class]) bundle:nil] forCellReuseIdentifier:YYTopicCellId];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    self.tableView.header.automaticallyChangeAlpha = YES;
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];

}

- (void)loadMoreTopics
{
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"type"] = @"1";
    params[@"c"] = @"data";
    params[@"maxtime"] = self.maxtime;
    
    // 发送请求
    __weak typeof(self) weakSelf = self;
    [self.manager GET:YYRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // 存储maxtime
        weakSelf.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典数组 -> 模型数组
        NSArray *moreTopics = [YYTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        // 增加到以前数组的最后面
        [weakSelf.topics addObjectsFromArray:moreTopics];
        
        //  weakSelf.topics = @[10, 9, 8]
        // moreTopics = @[7, 6 ,5]
        
        // weakSelf.topics = @[10, 9, 8, @[7, 6 ,5]]
        // [weakSelf.topics addObject:moreTopics];
        
        // weakSelf.topics = @[10, 9, 8, 7, 6 ,5]
        // [weakSelf.topics addObjectsFromArray:moreTopics];
        
        // 刷新表格
        [weakSelf.tableView reloadData];
        
        // 结束刷新
        [weakSelf.tableView.footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        // 结束刷新
        [weakSelf.tableView.footer endRefreshing];
    }];
    
}

- (void)loadNewTopics
{
    //加载帖子数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"type"] = @"1";
    params[@"c"] = @"data";
    
    __weak typeof(self) weakself = self;
    [self.manager GET:YYRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        weakself.topics = [YYTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [weakself.tableView reloadData];
    [weakself.tableView.header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [weakself.tableView.header endRefreshing];
    }];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.topics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YYTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:YYTopicCellId];
   
    cell.topic = self.topics[indexPath.row];
   
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.topics[indexPath.row].cellHeight;
}


@end
