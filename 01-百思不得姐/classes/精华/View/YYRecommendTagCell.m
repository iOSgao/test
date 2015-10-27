//
//  YYRecommendTagCell.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/10.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYRecommendTagCell.h"
#import "YYRecommendTag.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface YYRecommendTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageListView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;
@end

@implementation YYRecommendTagCell


- (void)setRecommendTag:(YYRecommendTag *)recommendTag
{
    _recommendTag = recommendTag;
    
    [self.imageListView setHeaderWithURL:recommendTag.image_list];
    
    self.themeNameLabel.text = recommendTag.theme_name;
    
    if (recommendTag.sub_number >= 10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人订阅",recommendTag.sub_number / 10000.0];
    }else{
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
    }
    
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
}

@end
