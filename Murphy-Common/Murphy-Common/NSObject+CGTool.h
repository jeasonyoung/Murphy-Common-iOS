//
//  NSObject+CGTool.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/6.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSObject (CGTool)

/**
 * @brief 绑定数据属性
 **/
@property(strong,nonatomic)id bindingData;

/**
 * @brief 计算字符串尺寸
 * @param text 字符串
 * @param font 字体
 * @param maxSize 最大尺寸
 **/
+(CGSize)getSizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 * @brief 适配图片大小
 * @param image 用来适配的图片
 * @param maxHeight 最大高度
 * @param maxWidth 最大宽度
 **/
+(CGSize)adaptiveWithImage:(UIImage *)image maxHeight:(CGFloat)maxHeight maxWidth:(CGFloat)maxWidth;

/**
 * @brief 十六进制颜色(html颜色值)字符串转为UIColor
 * @param hex 十六进制色值
 * @return 返回UIColor
 **/
+(UIColor *)hexStringToColor:(NSString *)hex;

/**
 * @brief 截取图片
 * @param view 要截取的界面
 * @param rect 要截取的范围
 * @return 返回截取的图片
 **/
+(UIImage *)getImageFromView:(UIView *)view rangRect:(CGRect)rect;

/**
 * @brief 存储空间
 * @return 返回存储空间
 **/
+(NSString *)usedSpaceAndFreeSpace;

@end
