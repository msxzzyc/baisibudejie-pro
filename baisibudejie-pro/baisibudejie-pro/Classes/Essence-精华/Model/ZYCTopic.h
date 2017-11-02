//
//  ZYCTopic.h
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/11/2.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYCTopic : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *profile_image;
@property(nonatomic,copy)NSString *create_time;
@property(nonatomic,copy)NSString *text;

@property(nonatomic,assign)NSInteger ding;
@property(nonatomic,assign)NSInteger cai;
@property(nonatomic,assign)NSInteger repost;
@property(nonatomic,assign)NSInteger comment;
@end
