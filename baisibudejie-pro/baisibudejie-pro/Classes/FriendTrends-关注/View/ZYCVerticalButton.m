//
//  ZYCVerticalButton.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/22.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCVerticalButton.h"

@implementation ZYCVerticalButton
- (void)setUp
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
        
    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
