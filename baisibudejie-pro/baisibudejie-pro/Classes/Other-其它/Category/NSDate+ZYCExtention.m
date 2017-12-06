//
//  NSDate+ZYCExtention.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/12/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "NSDate+ZYCExtention.h"

@implementation NSDate (ZYCExtention)
- (NSDateComponents *)deltaFrom:(NSDate *)from
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *compts = [calendar components:unit fromDate:from toDate:self options:0];
    
    return compts;
    
}

@end
