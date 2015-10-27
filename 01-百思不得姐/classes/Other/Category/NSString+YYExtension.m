//
//  NSString+YYExtension.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "NSString+YYExtension.h"

@implementation NSString (YYExtension)

- (unsigned long long)fileSize
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDirectory = NO;
    
    BOOL fileExists = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!fileExists) return 0;
    if (isDirectory) {
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
        unsigned long long fileSize = 0;
        for (NSString *subPath in enumerator) {
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            fileSize += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
    }
        return fileSize;
    }
    return [manager attributesOfItemAtPath:self error:nil].fileSize;
    
}


@end
