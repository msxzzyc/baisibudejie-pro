//
//  ZYCRecommendTagsCell.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/16.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCRecommendTagsCell.h"
#import "ZYCRecommendTag.h"
#import <UIImageView+WebCache.h>
@interface ZYCRecommendTagsCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end
@implementation ZYCRecommendTagsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setRecommendTag:(ZYCRecommendTag *)recommendTag
{
    _recommendTag = recommendTag;
    
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = recommendTag.theme_name;
    
    NSString *subNumber = nil;
    if (recommendTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
    } else {
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅",recommendTag.sub_number / 10000.0];
    }
    self.subNumberLabel.text = subNumber;
    
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 5;
    
    frame.size.width -= 2*frame.origin.x;
    frame.size.height -= 1;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
