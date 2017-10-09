//
//  ZYCRecommenCategoryCell.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/8.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCRecommenCategoryCell.h"
#import "ZYCRecommendCategory.h"
@interface ZYCRecommenCategoryCell()
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end
@implementation ZYCRecommenCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = ZYCRGBColor(244, 244, 244);
    self.textLabel.textColor = ZYCRGBColor(78, 78, 78);
    self.textLabel.highlightedTextColor = ZYCRGBColor(219, 21, 26);
    
    self.selectedIndicator.backgroundColor = ZYCRGBColor(219, 21, 26);
//    UIView *bg = [[UIView alloc]init];
//    bg.backgroundColor = [UIColor clearColor];
//    self.selectedBackgroundView = bg;
}

- (void)setCategory:(ZYCRecommendCategory *)category
{
    _category = category;
    
    self.textLabel.text = category.name;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2* self.textLabel.y;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : ZYCRGBColor(78, 78, 78);
}

@end
