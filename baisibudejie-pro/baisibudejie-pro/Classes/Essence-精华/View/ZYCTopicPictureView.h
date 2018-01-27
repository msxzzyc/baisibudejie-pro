//
//  ZYCTopicPictureView.h
//  baisibudejie-pro
//
//  Created by wpzyc on 2018/1/25.
//  Copyright © 2018年 wpzyc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYCTopic;

@interface ZYCTopicPictureView : UIView
@property(nonatomic,strong)ZYCTopic *topic;
+ (instancetype)pictureView;
@end
