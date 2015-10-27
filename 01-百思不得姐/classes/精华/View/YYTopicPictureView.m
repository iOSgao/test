//
//  XMGTopicPictureView.m
//  4期-百思不得姐
//
//  Created by xiaomage on 15/10/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYTopicPictureView.h"
#import "YYTopic.h"
#import <UIImageView+WebCache.h>

@interface YYTopicPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@end

@implementation YYTopicPictureView

+ (instancetype)pictureView
{
    
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)awakeFromNib
{
    // 去除默认的autoresizingMask设置
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(YYTopic *)topic
{
    
    _topic = topic;
    
    // 显示图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];

    self.gifView.hidden = !topic.is_gif;

    // 查看大图
    self.seeBigButton.hidden = !topic.isBigPicture;
    if (topic.isBigPicture) {
        self.imageView.contentMode = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
    } else {
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
    }
}
@end
