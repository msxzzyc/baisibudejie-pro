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
@interface ZYCTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end
@implementation ZYCTopicCell

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
    self.createTimeLabel.text = topic.create_time;
    
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
    static CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2*margin;
    frame.size.height -= margin;
    frame.origin.y += margin;
    
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
