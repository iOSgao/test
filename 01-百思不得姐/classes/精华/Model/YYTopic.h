//
//  YYTopic.h
//  01-百思不得姐
//
//  Created by Apple on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYComment;
typedef enum {
    /** 图片 */
    YYTopicTypePicture = 10,
    /** 文字 */
    YYTopicTypeWord = 29,
    /** 声音 */
    YYTopicTypeVoice = 31,
    /** 视频 */
    YYTopicTypeVideo = 41
} YYTopicType;

@interface YYTopic : NSObject

// 用户 -- 发帖者
/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *created_at;
/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
/** 帖子的类型 */
@property (nonatomic, assign) YYTopicType type;
/** 最热评论 */
@property (nonatomic, strong) YYComment *top_cmt;

/** 图片的宽度 */
@property (nonatomic, assign) CGFloat width;
/** 图片的高度 */
@property (nonatomic, assign) CGFloat height;
/** 小图 */
@property (nonatomic, copy) NSString *small_image;
/** 中图 */
@property (nonatomic, copy) NSString *middle_image;
/** 大图 */
@property (nonatomic, copy) NSString *large_image;
/** 是否为动态图 */
@property (nonatomic, assign) BOOL is_gif;

/* 辅助属性 */
/** 中间控件的frame */
@property (nonatomic, assign) CGRect centerViewFrame;
/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;
/** 是否为大图 */
@property (nonatomic, assign, getter=isBigPicture) BOOL bigPicture;


@end
