//
//  ZYCTabBar.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/9/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCTabBar.h"
@interface ZYCTabBar()
@property(nonatomic,weak)UIButton *publishButton;
@end
@implementation ZYCTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishButton.size = publishButton.currentBackgroundImage.size;
        self.publishButton = publishButton;
        [self addSubview:publishButton];
    }
    
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
   
    self.publishButton.center = CGPointMake(self.width*0.5, self.height*0.5);
    NSInteger index = 0;
    
    CGFloat buttonW = self.width/5;
    CGFloat buttonH = 44;
    
    CGFloat buttonY = 0;
    
    for (UIView *button in self.subviews) {
//        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        CGFloat buttonX = buttonW *((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        index++;
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
