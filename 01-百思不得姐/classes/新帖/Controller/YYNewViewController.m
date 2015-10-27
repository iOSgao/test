//
//  YYNewViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/9/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYNewViewController.h"

@interface YYNewViewController ()

@end

@implementation YYNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlighted:@"MainTagSubIconClick" target:self action:@selector(btnClick)];
}

- (void)btnClick
{
    YYLogFuc
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
