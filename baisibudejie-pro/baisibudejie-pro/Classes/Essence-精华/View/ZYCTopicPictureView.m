//
//  ZYCTopicPictureView.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2018/1/25.
//  Copyright © 2018年 wpzyc. All rights reserved.
//

#import "ZYCTopicPictureView.h"
#import "ZYCTopic.h"
#import <UIImageView+WebCache.h>
@interface ZYCTopicPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigImage;


@end

@implementation ZYCTopicPictureView
+ (instancetype)pictureView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (void)setTopic:(ZYCTopic *)topic
{
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
