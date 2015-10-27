//
//  YYMeSettingViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYMeSettingViewController.h"
#import "YYMeSettingTableViewCell.h"

@interface YYMeSettingViewController ()

@end

@implementation YYMeSettingViewController

static NSString * const YYMeSettingCellID = @"meSetting";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    [self.tableView registerClass:[YYMeSettingTableViewCell class] forCellReuseIdentifier:YYMeSettingCellID];
  
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYMeSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YYMeSettingCellID];
    
   
    
    return cell;
}



@end
