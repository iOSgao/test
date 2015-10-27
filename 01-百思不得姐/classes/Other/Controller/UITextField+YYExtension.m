//
//  UITextField+YYExtension.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/10.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UITextField+YYExtension.h"

#define YYPlaceholderColorKey @"placeholderLabel.textColor"

@implementation UITextField (YYExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (placeholderColor == nil) {
        [self setValue:[UIColor grayColor] forKeyPath:YYPlaceholderColorKey];
    }else{
        NSString *placeholder = self.placeholder;
        self.placeholder = @" ";
        [self setValue:placeholderColor forKeyPath:YYPlaceholderColorKey];
        self.placeholder = placeholder;
    }
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:YYPlaceholderColorKey];
}

@end
