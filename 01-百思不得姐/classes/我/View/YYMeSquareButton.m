//
//  YYMeSquareButton.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/11.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYMeSquareButton.h"
#import "YYMeSquare.h"
#import <UIButton+WebCache.h>
@implementation YYMeSquareButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.width = self.width * 0.5;
    self.imageView.height = self.imageView.width;
    self.imageView.y = self.height * 0.1;
    self.imageView.centerX = self.width * 0.5;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.bottom;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

- (void)setSquare:(YYMeSquare *)square
{
    _square = square;
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage circleImageName:@"defaultUserIcon"]];
   
}

@end
