//
//  YYNavigationController.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/3.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYNavigationController.h"

@interface YYNavigationController ()<UIGestureRecognizerDelegate>



@end

@implementation YYNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:dict];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   
   
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
    }
     [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

@end



