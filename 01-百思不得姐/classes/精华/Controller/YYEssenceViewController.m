//
//  YYEssenceViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/9/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYEssenceViewController.h"
#import "YYRecommendTagViewController.h"
#import "YYTitleButton.h"
#import "YYAllViewController.h"
#import "YYVideoViewController.h"
#import "YYVoiceViewController.h"
#import "YYPictureViewController.h"
#import "YYWordViewController.h"

@interface YYEssenceViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) YYTitleButton *selectedTitleButton;

@property (nonatomic, weak) UIView *titleIndicatorView;

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray *titleButtons;

@end

@implementation YYEssenceViewController


- (NSMutableArray *)titleButtons
{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildVcs];
    [self setUpNav];
    [self setUpScrollView];
    [self setUpTitlesView];
    [self addChildVcView];
    
}

- (void)setUpChildVcs
{
    YYAllViewController *all = [[YYAllViewController alloc] init];
    all.title = @"全部";
    [self addChildViewController:all];
    
    YYVideoViewController *video = [[YYVideoViewController alloc] init];
    video.title = @"视频";
    [self addChildViewController:video];
    
    YYVoiceViewController *voice = [[YYVoiceViewController alloc] init];
    voice.title = @"声音";
    [self addChildViewController:voice];
    
    YYPictureViewController *picture = [[YYPictureViewController alloc] init];
    picture.title = @"图片";
    [self addChildViewController:picture];
    
    YYWordViewController *word = [[YYWordViewController alloc] init];
    word.title = @"段子";
    [self addChildViewController:word];
}

- (void)setUpTitlesView
{
    //标题栏
    UIView *titlesView = [[UIView alloc] init];
    titlesView.frame = CGRectMake(0, 64, self.view.width, 40);
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [self.view addSubview:titlesView];
    
    //添加标题
//    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat titleButtonW = titlesView.width / 5;
    CGFloat titleButtonH = titlesView.height;
    for (int i = 0; i < 5; i++) {
        YYTitleButton *titleButton = [[YYTitleButton alloc] init];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
    }
    //添加底部的指示器
    UIView *titleIndicatorView = [[UIView alloc] init];
    [titlesView addSubview:titleIndicatorView];
    YYTitleButton *firstTitleButton = titlesView.subviews.firstObject;
    titleIndicatorView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    titleIndicatorView.height = 1;
    titleIndicatorView.bottom = titlesView.height;
    self.titleIndicatorView = titleIndicatorView;
    
    //默认状态下
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;
    [firstTitleButton.titleLabel sizeToFit];
    titleIndicatorView.width = firstTitleButton.titleLabel.width;
    titleIndicatorView.centerX = firstTitleButton.centerX;
    
}
//titleButton按钮的点击
- (void)titleButtonClick:(YYTitleButton *)titleButton
{
    
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.titleIndicatorView.width = titleButton.titleLabel.width;
        self.titleIndicatorView.centerX = titleButton.centerX;
    }];
    
    //滚动scrollView
    CGPoint offset = self.scrollView.contentOffset;
    
    offset.x = titleButton.tag * self.scrollView.width;

    [self.scrollView setContentOffset:offset animated:YES];
    
    
}
//设置ScrollView
- (void)setUpScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scrollView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count *scrollView.width, 0);
//    for (int i = 0; i < self.childViewControllers.count; i++) {
//        UITableViewController *vc = self.childViewControllers[i];
//        vc.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
//        vc.tableView.scrollIndicatorInsets = vc.tableView.contentInset;
//        vc.tableView.x = i * scrollView.width;
//        vc.tableView.y = 0;
//        vc.tableView.width = scrollView.width;
//        vc.tableView.height = scrollView.height;
//        [scrollView addSubview:vc.tableView];
//        
//    }
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    self.scrollView = scrollView;
    
}

- (void)setUpNav
{
     self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlighted:@"MainTagSubIconClick" target:self action:@selector(btnClick)];
}


- (void)btnClick
{
    YYRecommendTagViewController *vc = [[YYRecommendTagViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    [self addChildVcView];
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    int index = scrollView.contentOffset.x / scrollView.width;
    YYTitleButton *titleButton = self.titleButtons[index];
    [self titleButtonClick:titleButton];
    [self addChildVcView];
}

- (void)addChildVcView
{

    UIScrollView *scrollView = self.scrollView;
    int index = scrollView.contentOffset.x / scrollView.width;
    UIViewController *willShowVc = self.childViewControllers[index];
    if (willShowVc.isViewLoaded) return;
    [scrollView addSubview:willShowVc.view];
    willShowVc.view.frame = scrollView.bounds;

}

@end
