//
//  UIImage+YYExtension.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/10.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UIImage+YYExtension.h"

@implementation UIImage (YYExtension)

- (instancetype)circleImage
{
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(context,rect);
    
    CGContextClip(context);
    
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


+ (instancetype)circleImageName:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}

@end
