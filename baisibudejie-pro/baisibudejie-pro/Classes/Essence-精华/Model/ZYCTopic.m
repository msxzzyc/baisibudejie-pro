//
//  ZYCTopic.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/11/2.
//  Copyright © 2017年 wpzyc. All rights reserved.
//
#import "ZYCTopic.h"
//#import <MJExtension.h>
@implementation ZYCTopic

{
   CGFloat _cellHeight;
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"small_image":@"image0",
             @"large_image":@"image1",
             @"middle_image":@"image2"
             
             };
}

- (CGFloat)cellHeight
{
    if (!_cellHeight) {
        ZYCLog(@"%@---\n%@----\n%@",self.small_image,self.middle_image,self.large_image);
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, MAXFLOAT);
        //    CGFloat textH = [topic.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maxSize].height;
        CGFloat textH = [_text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        _cellHeight = ZYCTopicCellTextY + textH +ZYCTopicCellBottomBarH +2*ZYCTopicCellMargin + self.height;
    }
    
    return _cellHeight;
}
- (NSString *)create_time
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *create = [fmt dateFromString:_create_time];
    
    if (create.isThisYear) {
        if (create.isToday) {
            NSDateComponents *compt = [now deltaFrom:create];
            if (compt.hour >= 1) {
                return  [NSString stringWithFormat:@"%zd小时前",compt.hour];
            } else if(compt.minute >= 1){
                return  [NSString stringWithFormat:@"%zd分钟前",compt.minute];
            }else return  @"刚刚";
        } else if(create.isYesterday) {
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return  [fmt stringFromDate:create];
        }else{
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return  [fmt stringFromDate:create];
            
        }
    } else {
        return  _create_time;
    }
}

@end
