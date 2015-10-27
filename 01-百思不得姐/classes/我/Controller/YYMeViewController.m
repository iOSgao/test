//
//  YYMeViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/9/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYMeViewController.h"
#import "YYMeFooter.h"
#import "YYMeCell.h"
#import "YYMeSettingViewController.h"

@interface YYMeViewController ()

@end

@implementation YYMeViewController

static NSString * const YYMeCellID = @"me";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    
    [self setUpNav];
}

- (void)setUpTableView
{
    self.tableView.backgroundColor = [UIColor grayColor];
    [self.tableView registerClass:[YYMeCell class] forCellReuseIdentifier:YYMeCellID];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = YYMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(10 - 35, 0, 0, 0);
    

   

    self.tableView.tableFooterView = [[YYMeFooter alloc] init];

}

- (void)setUpNav
{
    self.navigationItem.title = @"我";
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlighted:@"mine-setting-icon-click" target:self action:@selector(btnClick1)];
    UIBarButtonItem *item2 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highlighted:@"mine-moon-icon-click" target:self action:@selector(btnClick2)] ;
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
}

- (void)btnClick1
{
    
    YYMeSettingViewController *vc = [[YYMeSettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
//    vc.view.backgroundColor = [UIColor purpleColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btnClick2
{
    YYLogFuc
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYMeCell *cell = [tableView dequeueReusableCellWithIdentifier:YYMeCellID];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
    }else{
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    
    return cell;
}


@end
