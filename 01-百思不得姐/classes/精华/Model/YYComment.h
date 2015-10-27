//
//  YYComment.h
//  01-百思不得姐
//
//  Created by Apple on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYUser;
@interface YYComment : NSObject

/** 评论内容 */
@property (nonatomic, copy) NSString *content;

/** 发表这条评论的用户 */
@property (nonatomic, strong) YYUser *user;

@end
