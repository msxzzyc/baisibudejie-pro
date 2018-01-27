//
//  ZYCTopicCell.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/12/3.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCTopicCell.h"
#import "ZYCTopic.h"
#import <UIImageView+WebCache.h>
#import "ZYCTopicPictureView.h"
@interface ZYCTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIImageView *sinaVView;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;

@property (weak, nonatomic) ZYCTopicPictureView *pictureView;
@end
@implementation ZYCTopicCell

- (ZYCTopicPictureView *)pictureView
{
    if (!_pictureView) {
        ZYCTopicPictureView *pictureView = [ZYCTopicPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView ;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
    
}

- (void)setTopic:(ZYCTopic *)topic
{
    
    _topic = topic;
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image]placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
//    topic.sina_v = (int)arc4random_uniform(100)%2;
    self.sinaVView.hidden = !topic.isSina_v;
    
//    ZYCLog(@"%@",topic.create_time);
    
    self.createTimeLabel.text = topic.create_time;
    
    self.text_Label.text = topic.text;
    
    if (topic.type == ZYCTopicTypePicture) {
        self.pictureView.topic = topic;
        self.pictureView.frame = topic.pictureViewFrame;
    }
    
    
    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
    
//    NSInteger year = [calendar component:NSCalendarUnitYear fromDate:now];
    
//    NSDateComponents *cmts = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:now];
    
//    NSCalendarUnit unit = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
//    NSDateComponents *comp = [now deltaFrom:create];
    
    
//    ZYCLog(@"%zd %zd %zd %zd %zd %zd ",comp.year,comp.month,comp.day,comp.hour,comp.minute,comp.second);
//    ZYCLog(@"%@",comp);
    
    [self setButtonTitle:_dingButton count:topic.ding placeholder:@"顶"];
    [self setButtonTitle:_caiButton count:topic.cai placeholder:@"踩"];
    [self setButtonTitle:_shareButton count:topic.repost placeholder:@"分享"];
    [self setButtonTitle:_commentButton count:topic.comment placeholder:@"评论"];

}
- (void)setButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder
{
//    NSString *title = nil;
//
//    if (count == 0) {
//        title = placeholder;
//
//    } else if(count > 10000){
//        title = [NSString stringWithFormat:@"%.1f万",count/10000.0];
//    }else{
//        title = [NSString stringWithFormat:@"%zd",count];
//    }
//    [button setTitle:title forState:UIControlStateNormal];
    
   
    
        
    if(count > 10000){
        placeholder = [NSString stringWithFormat:@"%.1f万",count/10000.0];
    }else if(count > 0){
        placeholder = [NSString stringWithFormat:@"%zd",count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}
- (void)setFrame:(CGRect)frame
{
    
    frame.origin.x = ZYCTopicCellMargin;
    frame.size.width -= 2*ZYCTopicCellMargin;
    frame.size.height -= ZYCTopicCellMargin;
    frame.origin.y += ZYCTopicCellMargin;
    
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
