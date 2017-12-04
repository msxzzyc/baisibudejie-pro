//
//  ZYCTopicCell.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/12/3.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCTopicCell.h"
#import "ZYCTopic.h"
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
//    cell.textLabel.text = topic.name;
//    cell.detailTextLabel.text = topic.text;
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
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
