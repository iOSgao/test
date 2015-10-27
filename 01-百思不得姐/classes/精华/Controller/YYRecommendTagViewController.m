//
//  YYRecommendTagViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/10.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYRecommendTagViewController.h"
#import "YYRecommendTag.h"
#import "YYRecommendTagCell.h"
#import <MJExtension/MJExtension.h>
#import <AFNetworking/AFNetworking.h>



@interface YYRecommendTagViewController ()

@property (nonatomic, strong) NSArray *recommendTags;

@end
@implementation YYRecommendTagViewController

static NSString * const ID = @"recommendTag";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"推荐标签";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:ID];
    [self loadNewRecommendTags];
    
    self.tableView.rowHeight = 70;
}


- (void)loadNewRecommendTags
{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"a"] = @"tag_recommend";
    parameter[@"action"] = @"sub";
    parameter[@"c"] = @"topic";
    [[AFHTTPSessionManager manager] GET:YYRequestURL parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.recommendTags = [YYRecommendTag objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        YYLog(@"加载失败---%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.recommendTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.recommendTag = self.recommendTags[indexPath.row];
    return cell;
}

@end
