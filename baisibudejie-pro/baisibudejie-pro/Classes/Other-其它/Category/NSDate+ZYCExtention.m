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
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear == selfYear;
    
}

//- (BOOL)isToday
//{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//
//    NSCalendarUnit unit = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
//    NSDateComponents *nowCompts = [calendar components:unit fromDate:[NSDate date]];
//    NSDateComponents *selfCompts = [calendar components:unit fromDate:self];
//
//    return nowCompts.year == selfCompts.year && nowCompts.month == selfCompts.month && nowCompts.day == selfCompts.day;
//}
- (BOOL)isToday
{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSString *selfString = [fmt stringFromDate:self];
    
    return [nowString isEqualToString:selfString];
}

- (BOOL)isYesterday
{

    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    NSDateComponents *compts = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return compts.year == 0&&compts.month == 0&& compts.day == 1;
   
}
@end
