//
//  ZYCTopicViewController.h
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/12/13.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    ZYCTopicTypeAll = 1,
    ZYCTopicTypePicture = 10,
    ZYCTopicTypeWord = 29,
    ZYCTopicTypeVoice = 31,
    ZYCTopicTypeVideo = 41
    
}ZYCTopicType;
@interface ZYCTopicViewController : UITableViewController

@property(nonatomic,assign)ZYCTopicType type;
@end
