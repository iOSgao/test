//
//  YYTabBarController.m
//  01-百思不得姐
//
//  Created by Apple on 15/9/28.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYTabBarController.h"
#import "YYEssenceViewController.h"
#import "YYNewViewController.h"
#import "YYFriendTrendsViewController.h"
#import "YYMeViewController.h"
#import "YYTabBar.h"

@interface YYTabBarController ()

@end

@implementation YYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setValue:@"YYTabBar" forKeyPath:@"tabBar"];
    [self setUpChildVcs];
    
    [self setUpItemAttr];
    [self setAllViewController];
    
    [self setUpTabBar];
}

- (void)setUpChildVcs
{
    
}

- (void)setUpTabBar
{
    [self setValue:[[YYTabBar alloc] init] forKeyPath:@"tabBar"];
}

//设置所有的控制器
- (void)setAllViewController
{
    [self setUpViewController:[[YYEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setUpViewController:[[YYMeViewController alloc] initWithStyle:UITableViewStyleGrouped] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    [self setUpViewController:[[YYNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    YYFriendTrendsViewController *vc = [UIStoryboard storyboardWithName:NSStringFromClass([YYFriendTrendsViewController class]) bundle:nil].instantiateInitialViewController;
    [self setUpViewController:vc title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
   
}

//设置一个控制器
- (void)setUpViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName
{
    vc.title = title;
//        vc.navigationItem.title = title;
//        vc.tabBarItem.title = title;
    vc.view.backgroundColor = [UIColor lightGrayColor];
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    YYNavigationController *nav = [[YYNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
//设置Item的title属性
- (void)setUpItemAttr
{
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}



@end
