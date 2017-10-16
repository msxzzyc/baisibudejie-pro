//
//  ZYCRecommendUserCell.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/10.
//  Copyright © 2017年 wpzyc. All rights reserved.
//
#import "ZYCRecommendUser.h"
#import "ZYCRecommendUserCell.h"
#import <UIImageView+WebCache.h>
@interface ZYCRecommendUserCell()
@property (weak, nonatomic) IBOutlet UIImageView *userHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;
@end
@implementation ZYCRecommendUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUser:(ZYCRecommendUser *)user
{
    _user = user;
    [self.userHeaderImage sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.screenNameLabel.text = user.screen_name;
    NSString *fansCount = nil;
    if (user.fans_count < 10000) {
        fansCount = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    } else {
        fansCount = [NSString stringWithFormat:@"%.1f万人关注",user.fans_count / 10000.0];
    }
    self.fansCountLabel.text = fansCount;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
