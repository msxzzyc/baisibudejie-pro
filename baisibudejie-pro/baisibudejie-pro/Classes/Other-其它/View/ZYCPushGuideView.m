//
//  ZYCPushGuideView.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/24.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCPushGuideView.h"

@implementation ZYCPushGuideView
+ (instancetype)guideView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}

- (IBAction)close {
    
    [self removeFromSuperview];
    ZYCLogFuc;
}
+ (void)show
{
    NSString *key = @"CFBundleInfoDictionaryVersion";
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    NSString *sandboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    ZYCLog(@"%@-----%@",currentVersion,sandboxVersion);
    if (![currentVersion isEqualToString:sandboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        ZYCPushGuideView *guideView = [ZYCPushGuideView guideView];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
