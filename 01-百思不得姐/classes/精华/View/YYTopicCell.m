//
//  YYTopicCell.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYTopicCell.h"
#import "YYTopic.h"
#import "YYComment.h"
#import "YYUser.h"
#import "YYTopicPictureView.h"


@interface YYTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
@property (weak, nonatomic) IBOutlet UILabel *topCmtContentLabel;

/* 中间控件 */
/** 图片控件 */
@property (nonatomic, weak) YYTopicPictureView *pictureView;
@end

@implementation YYTopicCell

- (YYTopicPictureView *)pictureView
{
    if (!_pictureView) {
        YYTopicPictureView *pictureView = [YYTopicPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return  _pictureView;
}

- (void)awakeFromNib
{
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopic:(YYTopic *)topic
{
    _topic = topic;
    [self.profileImageView setHeaderWithURL:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.text_label.text = topic.text;
    self.createdAtLabel.text = topic.created_at;
    
    
    [self setupButton:self.dingButton number:topic.ding title:@"顶"];
    [self setupButton:self.caiButton number:topic.cai title:@"踩"];
    [self setupButton:self.repostButton number:topic.repost title:@"分享"];
    [self setupButton:self.commentButton number:topic.comment title:@"评论"];

    // 最热评论
    if (topic.top_cmt) { // 有最热评论
        self.topCmtView.hidden = NO;
        // 内容
        NSString *content = topic.top_cmt.content;
        // 用户名
        NSString *username = topic.top_cmt.user.username;
        self.topCmtContentLabel.text = [NSString stringWithFormat:@"%@ : %@", username, content];
    } else {
        self.topCmtView.hidden = YES;
    }
    
    // 中间的具体内容
    if (topic.type == YYTopicTypePicture) { // 图片
        // 往中间添加图片控件
        
        
        self.pictureView.hidden = NO;
        self.pictureView.frame = topic.centerViewFrame; // frame
        
       
        self.pictureView.topic = topic; // 数据
    } else if (topic.type == YYTopicTypeVoice) { // 声音
        self.pictureView.hidden = YES;
        
    } else if (topic.type == YYTopicTypeVideo) { // 视频
        self.pictureView.hidden = YES;
        
    } else { // 文字
        self.pictureView.hidden = YES;
        
    }


}

- (void)setupButton:(UIButton *)button number:(NSInteger)number title:(NSString *)title
{
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number / 10000.0] forState:UIControlStateNormal];
    } else if (number == 0) {
        [button setTitle:title forState:UIControlStateNormal];
    } else {
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= YYMargin;
    [super setFrame:frame];
}

- (IBAction)moreClick {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        YYLog(@"点击了[收藏]");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        YYLog(@"点击了[举报]");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        YYLog(@"点击了[取消]");
    }]];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
