//
//  YYTabBar.m
//  01-百思不得姐
//
//  Created by Apple on 15/9/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYTabBar.h"

@interface YYTabBar()

@property (nonatomic, strong) UIButton *bnt;

@end

@implementation YYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
    
    UIButton *bnt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bnt setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [bnt setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    [bnt sizeToFit];
    [self addSubview:bnt];
        self.bnt = bnt;
        
    }
    return self;

}

- (void)layoutSubviews
{
    [super layoutSubviews];
   
    CGFloat W = self.bounds.size.width / 5;
    CGFloat H = self.bounds.size.height;
    
    self.bnt.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
    CGFloat Y = 0;
    int index = 0;
    for (UIView *tabBarButton in self.subviews) {
        NSString *className = NSStringFromClass(tabBarButton.class);
        if (![className isEqualToString:@"UITabBarButton"]) continue;
        CGFloat X = index * W;
        if (index >= 2) {
            X += W;
        }
        tabBarButton.frame = CGRectMake(X, Y, W, H);
        index++;
    }
}

@end
