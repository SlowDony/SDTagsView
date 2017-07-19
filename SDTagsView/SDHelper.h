//
//  SDHelper.h
//  SDTagsView
//
//  Created by slowdony on 2017/7/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SDHelper : NSObject

/**
  计算文字长度

 @param text 文字
 @param font 字体
 @return 长度
 */
+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)font;

/**
 16进制转换 颜色

 @param hexColor 颜色
 @return 转换后的颜色
 */
+(UIColor *) getColor:(NSString *)hexColor;
@end
