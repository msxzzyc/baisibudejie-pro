//
//  ZYCTopic.h
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/11/2.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYCTopic : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *profile_image;
@property(nonatomic,copy)NSString *create_time;
@property(nonatomic,copy)NSString *text;

@property(nonatomic,assign)NSInteger ding;
@property(nonatomic,assign)NSInteger cai;
@property(nonatomic,assign)NSInteger repost;
@property(nonatomic,assign)NSInteger comment;
@property(nonatomic,assign,getter=isSina_v)BOOL sina_v;

@property(nonatomic,assign,readonly)CGFloat cellHeight;
@property(nonatomic,assign,readonly)CGRect pictureFrame;

@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;

@property(nonatomic,copy)NSString *small_image;
@property(nonatomic,copy)NSString *middle_image;
@property(nonatomic,copy)NSString *large_image;

@property(nonatomic,assign)ZYCTopicType type;

@property(nonatomic,assign,getter=isBigPicture)BOOL BigPicture;
@end
