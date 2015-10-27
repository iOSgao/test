//
//  YYFriendTrendsViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/9/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYFriendTrendsViewController.h"

@interface YYFriendTrendsViewController ()

@end

@implementation YYFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlighted:@"friendsRecommentIcon-click" target:self action:@selector(btnClick)];
}
- (void)btnClick
{
    YYLogFuc
}

- (IBAction)backToYYFriendTrendsViewController:(UIStoryboardSegue *)segue
{
    YYLog(@"从%@控制器回来的", segue.sourceViewController);
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
