//
//  ZYCTextField.m
//  baisibudejie-pro
//
//  Created by wpzyc on 2017/10/22.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCTextField.h"
#import <objc/runtime.h>

static NSString *const ZYCPlaceholderColorKeyPath = @"_placeholderLabel.textColor";
@implementation ZYCTextField

//+ (void)initialize
//{
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([UITextField class], &count);
//    for (int i = 0; i<count; i++) {
//        Ivar ivar = *(ivars + i);
//        Ivar ivar = ivars[i];
//        ZYCLog(@"%s",ivar_getName(ivar));
//    }
//    free(ivars);
//
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    
//    UILabel *placeholderLabel = [self valueForKeyPath:@"_placeholderLabel"];
//    placeholderLabel.textColor = [UIColor whiteColor];
//    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self resignFirstResponder];
    self.tintColor = self.textColor;
}

- (BOOL)becomeFirstResponder
{
    [self setValue:self.textColor forKeyPath:ZYCPlaceholderColorKeyPath];
    return [super becomeFirstResponder];
    
}

- (BOOL)resignFirstResponder
{
    [self setValue:[UIColor grayColor] forKeyPath:ZYCPlaceholderColorKeyPath];
    return [super resignFirstResponder];
}
//- (void)drawPlaceholderInRect:(CGRect)rect
//{
////    [super drawPlaceholderInRect:rect];
//    [self.placeholder drawInRect:CGRectMake(0, 3, 100, 25) withAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : self.font}];
//}
@end
