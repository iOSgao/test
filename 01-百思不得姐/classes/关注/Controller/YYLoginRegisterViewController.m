//
//  YYLoginRegisterViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYLoginRegisterViewController.h"

@interface YYLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftmargin;

@end

@implementation YYLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)changeRegOrLogin:(UIButton *)button {
    
    button.selected = !button.isSelected;
    
    if(self.leftmargin.constant==0)
    {
        self.leftmargin.constant-=[UIScreen mainScreen].bounds.size.width;
        
    }else
    {
        self.leftmargin.constant = 0;
    }
    [UIView animateWithDuration:0.25 animations:^{
          [self.view layoutIfNeeded];
    }];
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
