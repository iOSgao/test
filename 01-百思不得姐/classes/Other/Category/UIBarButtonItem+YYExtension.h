//
//  UIBarButtonItem+YYExtension.h
//  01-百思不得姐
//
//  Created by Apple on 15/9/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YYExtension)

+ (instancetype)itemWithImage:(NSString *)normalImageName highlighted:(NSString *)highlightedImageName target:(id)target action:(SEL)action;

@end
