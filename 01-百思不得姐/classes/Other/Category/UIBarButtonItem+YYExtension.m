//
//  UIBarButtonItem+YYExtension.m
//  01-百思不得姐
//
//  Created by Apple on 15/9/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UIBarButtonItem+YYExtension.h"

@implementation UIBarButtonItem (YYExtension)

+ (instancetype)itemWithImage:(NSString *)normalImageName highlighted:(NSString *)highlightedImageName target:(id)target action:(SEL)action
{
    UIButton *bnt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bnt setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [bnt setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [bnt sizeToFit];
    [bnt addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:bnt];
    
}

@end
