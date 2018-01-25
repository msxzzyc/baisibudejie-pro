//
//  ZYCRecommendCategory.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/8.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCRecommendCategory.h"
#import <MJExtension.h>
@implementation ZYCRecommendCategory

//+ (NSDictionary *)mj_replacedKeyFromPropertyName
//{
//    return @{
//             @"ID":@"id"
//             };
//}
+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"ID"]) return @"id";
        return propertyName;
    
}
- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}
@end
