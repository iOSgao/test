

#import "YYExtensionConfig.h"
#import <MJExtension.h>
#import "YYTopic.h"
#import "YYComment.h"

@implementation YYExtensionConfig
+ (void)load
{
    [YYTopic setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"top_cmt" : @"top_cmt[0]",
                 @"small_image" : @"image0",
                 @"middle_image" : @"image2",
                 @"large_image" : @"image1",
                 };
    }];
}
@end
