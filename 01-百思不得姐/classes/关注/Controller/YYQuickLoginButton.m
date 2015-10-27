//
//  YYQuickLoginButton.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYQuickLoginButton.h"

@implementation YYQuickLoginButton

- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置图片
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    //设置文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    
}


@end
