//
//  YYTopic.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYTopic.h"
#import "YYComment.h"
#import "YYUser.h"

@implementation YYTopic

- (NSString *)created_at
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyy-MM-dd HH:mm:ss";
    NSDate *createdAtDate = [fmt dateFromString:_created_at];
    if (createdAtDate.isThisYear) {
        if (createdAtDate.isToday) {
            NSDate *nowDate = [NSDate date];
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSCalendarUnit unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents *cmps = [calendar components:unit fromDate:createdAtDate toDate:nowDate options:0];
            if (cmps.hour >= 1) { // 时间间隔 >= 1个小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1个小时 > 时间间隔 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else {
                return @"刚刚";
            }
            
        }else if(createdAtDate.isYesterday){
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:createdAtDate];
        }else{
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:createdAtDate];
        }
        
        
    }else{//非今年
        return _created_at;
    }
}

//- (CGRect)centerViewFrame
//{
//    
//    
//    // 【中间控件】的X值
//    CGFloat centerViewX = YYMargin;
//    
//    // 文字的Y值
//    CGFloat textY = 55;
//    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 * YYMargin;
//    // 文字的高度
//    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;
//    // 【中间控件】的Y值
//    CGFloat centerViewY = textY + textH + YYMargin;
//    
//    // 【中间控件】的宽度
//    CGFloat centerViewW = textMaxW;
//    
//    // 【中间控件】的高度
//    CGFloat centerViewH = self.height * centerViewW / self.width;
//    if (centerViewH >= [UIScreen mainScreen].bounds.size.height) {
//        centerViewH = 200;
//        self.bigPicture = YES;
//    }
//    
//    return CGRectMake(centerViewX, centerViewY, centerViewW, centerViewH);
//}

/**
 *  在这个方法中计算了cellHeight和centerViewFrame
 */
- (CGFloat)cellHeight
{
    // 如果已经计算过cellHeight，就直接返回以前的值
    if (_cellHeight) return _cellHeight;
    
    // 文字的Y值
    CGFloat textY = 55;
    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 * YYMargin;
    // 文字的高度
    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;
    _cellHeight = textY + textH + YYMargin;
    
    // 有中间内容
    if (self.type != YYTopicTypeWord) {
        // 【中间控件】的X值
        CGFloat centerViewX = YYMargin;
        // 【中间控件】的Y值
        CGFloat centerViewY = textY + textH + YYMargin;
        // 【中间控件】的宽度
        CGFloat centerViewW = textMaxW;
        // 【中间控件】的高度
        CGFloat centerViewH = self.height * centerViewW / self.width;
        if (centerViewH >= [UIScreen mainScreen].bounds.size.height) {
            centerViewH = 200;
            self.bigPicture = YES;
        }
        _centerViewFrame = CGRectMake(centerViewX, centerViewY, centerViewW, centerViewH);
        
        _cellHeight += centerViewH + YYMargin;
    }
    
    // 有最热评论
    if (self.top_cmt) {
        CGFloat topCmtTitleH = 20;
        NSString *topCmtText = [NSString stringWithFormat:@"%@ : %@", self.top_cmt.user.username, self.top_cmt.content];
        CGFloat topCmtTextH = [topCmtText boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        _cellHeight += topCmtTitleH + topCmtTextH + YYMargin;
    }
    
    // 底部工具条
    CGFloat toolbarH = 35;
    _cellHeight += toolbarH + YYMargin;
    
    return _cellHeight;
}


@end
