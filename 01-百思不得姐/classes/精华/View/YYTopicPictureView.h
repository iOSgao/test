//
//  XMGTopicPictureView.h
//  4期-百思不得姐
//
//  Created by xiaomage on 15/10/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYTopic;

@interface YYTopicPictureView : UIView
+ (instancetype)pictureView;

/** 帖子模型数据 */
@property (nonatomic, strong) YYTopic *topic;
@end
