//
//  YYMeFooter.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/11.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYMeFooter.h"
#import <MJExtension.h>
#import <AFHTTPSessionManager.h>
#import "YYMeSquare.h"
#import "YYMeSquareButton.h"
#import "YYWebViewController.h"

@implementation YYMeFooter

- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        parameter[@"a"] = @"square";
        parameter[@"c"] = @"topic";
        
        __weak typeof(self) weakSelf = self;
        [[AFHTTPSessionManager manager] GET:YYRequestURL parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//            //数据解析下来写入.plist文件查看
//            NSData *data = responseObject;
//            [data writeToFile:@"/Users/apple/Desktop/aaa.plist" atomically:YES];
            
            NSArray *square = [YYMeSquare objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [weakSelf createSquares:square];
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
    }
    return self;
}

- (void)createSquares:(NSArray *)squares
{
    
    NSUInteger columnsCount = 4;
    NSUInteger count = squares.count;
    
//    YYLog(@"%lu",(unsigned long)squares.count);
    
    CGFloat buttonW = self.width / columnsCount;
    CGFloat buttonH = buttonW;
    
    for (NSUInteger i = 0; i < count; i++) {
        YYMeSquareButton *button = [YYMeSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        button.x = (i % columnsCount) * buttonW;
        button.y = (i / columnsCount) * buttonH;
        button.width = buttonW;
        button.height = buttonH;
        
        button.square = squares[i];
        
    }
    self.height = self.subviews.lastObject.bottom;
    

    
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    
    
}

- (void)buttonClick:(YYMeSquareButton *)button
{
    NSString *url = button.square.url;
    if ([url hasPrefix:@"mod://"]) {
       
    }else if ([url hasPrefix:@"http://"]){
        UITabBarController *root = (UITabBarController *)self.window.rootViewController;
       UINavigationController *nav = root.selectedViewController;
        
        
        
        YYWebViewController *web = [[YYWebViewController alloc] init];
        
        web.url = url;
        web.navigationItem.title = button.square.name;
        [nav pushViewController:web animated:YES];
    }else{
        
    }
}

@end
