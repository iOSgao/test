//
//  YYMeSettingTableViewCell.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYMeSettingTableViewCell.h"

#import <SVProgressHUD/SVProgressHUD.h>


#define YYCachesFilePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"default"]

@implementation YYMeSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       self.textLabel.text = @"清理缓存";
        
        self.userInteractionEnabled = NO;
        
        UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadView startAnimating];
        self.accessoryView = loadView;
        
        
        
        [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
            
            [NSThread sleepForTimeInterval:2.0];
            
            CGFloat fileSize = YYCachesFilePath.fileSize;
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.textLabel.text  = [NSString stringWithFormat:@"清理缓存(%.2fGB)",fileSize / 1000000.0];
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                self.userInteractionEnabled = YES;
            }];
        }];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearCaches)]];
        
        
        
    }
    return self;
}


- (void)fileSize1
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES).lastObject ;
//    YYLog(@"%@",path);
    NSString *filePath = [path stringByAppendingPathComponent:@"default"];

    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subPaths = [manager subpathsAtPath:filePath];
    
    CGFloat fileSize = 0;
    for (NSString *subPath in subPaths) {
        NSString *fullPath = [filePath stringByAppendingPathComponent:subPath];
        fileSize += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
    }
    self.textLabel.text  = [NSString stringWithFormat:@"清理缓存(%.2fGB)",fileSize / 1000000.0];
}

- (void)fileSize
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"default"];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:filePath];
    CGFloat fileSize = 0;
    for (NSString *subPath in enumerator) {
        NSString *fullPath = [filePath stringByAppendingPathComponent:subPath];
        fileSize += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
    }
    self.textLabel.text  = [NSString stringWithFormat:@"清理缓存(%.2fGB)",fileSize / 1000000.0];

}

- (void)clearCaches
{
    
    [SVProgressHUD showInfoWithStatus:@"正在清理缓存..." maskType:SVProgressHUDMaskTypeBlack];
  
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        
        
        [[NSFileManager defaultManager] removeItemAtPath:YYCachesFilePath error:nil];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [SVProgressHUD dismiss];
            self.textLabel.text = @"清理缓存(0B)";
            
        }];
    }];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    UIActivityIndicatorView *loadView = (UIActivityIndicatorView *)self.accessoryView;
    [loadView startAnimating];
}

@end
