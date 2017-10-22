//
//  ZYCTextField.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/22.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCTextField.h"

@implementation ZYCTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawPlaceholderInRect:(CGRect)rect
{
//    [super drawPlaceholderInRect:rect];
    [self.placeholder drawInRect:CGRectMake(0, 3, 100, 25) withAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : self.font}];
}
@end
