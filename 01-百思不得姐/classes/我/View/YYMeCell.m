//
//  YYMeCell.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/11.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYMeCell.h"

@implementation YYMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
        self.textLabel.textColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.imageView.image ==  nil) return;
    self.imageView.height = self.contentView.height - YYMargin;
    self.imageView.width = self.imageView.height;
    self.imageView.centerY = self.contentView.height * 0.5;
    
    self.textLabel.x = self.imageView.right + YYMargin;
}

@end
