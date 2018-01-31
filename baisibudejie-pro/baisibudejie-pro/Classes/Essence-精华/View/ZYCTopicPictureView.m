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
#import <DALabeledCircularProgressView.h>
@interface ZYCTopicPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigImage;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;



@end

@implementation ZYCTopicPictureView
+ (instancetype)pictureView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.progressView.roundedCorners = 2;
    self.progressView.progressLabel.textColor = [UIColor whiteColor];
}
- (void)setTopic:(ZYCTopic *)topic
{
    _topic = topic;
    
    [self.imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:nil progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        self.progressView.hidden = NO;
        
        CGFloat progress = 1.0*receivedSize/expectedSize;
        [self.progressView setProgress:progress animated:YES];
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.progressView.hidden = YES;
    }];
    NSString *extension = topic.large_image.pathExtension;
    self.gifView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
    
    if (topic.BigPicture) {
        self.seeBigImage.hidden = NO;
        self.imageView.contentMode = UIViewContentModeTop;
    } else {
        self.seeBigImage.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
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
