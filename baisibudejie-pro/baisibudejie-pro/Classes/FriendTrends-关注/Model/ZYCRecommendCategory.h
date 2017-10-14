//
//  ZYCRecommendCategory.h
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/8.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYCRecommendCategory : NSObject
@property(nonatomic,assign)NSInteger id;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *users;
@property(nonatomic,assign)NSInteger total;
@property(nonatomic,assign)NSInteger currentPage;
@end
