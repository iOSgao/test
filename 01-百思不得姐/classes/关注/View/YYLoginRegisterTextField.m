//
//  YYLoginRegisterTextField.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYLoginRegisterTextField.h"

@implementation YYLoginRegisterTextField

- (void)awakeFromNib
{
    self.tintColor = [UIColor whiteColor];
    self.textColor = [UIColor whiteColor];
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}

- (BOOL)becomeFirstResponder
{
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super resignFirstResponder];
}

@end
