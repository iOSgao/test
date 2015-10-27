//
//  UIImageView+YYExtension.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/10.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UIImageView+YYExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (YYExtension)

- (void)setHeaderWithURL:(NSString *)url
{
    [self setCircleHeaderWithURL:url];
}

-(void)setCircleHeaderWithURL:(NSString *)url
{
    UIImage *placeholder = [UIImage circleImageName:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return ;
        self.image = [image circleImage];
    }];
    
}

- (void)setRectHeaderWithURL:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

@end
