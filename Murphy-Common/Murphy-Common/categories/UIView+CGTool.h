//
//  UIView+CGTool.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/4.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CGTool)

/**
 * @brief 设置阴影。
 * @param shadowOffset layer偏移量
 * @param shadowRadius 阴影到焦点的半径
 * @param shadowColor  阴影颜色
 * @param shadowOpacity 阴影透明度
 * @param cornerRadius 圆角
 * @param masksToBounds 是否有阴影
 **/
-(void)getShadowOffset:(CGSize)shadowOffset
          shadowRadius:(CGFloat)shadowRadius
           shadowColor:(UIColor *)shadowColor
         shadowOpacity:(CGFloat)shadowOpacity
          cornerRadius:(CGFloat)cornerRadius
         masksToBounds:(BOOL)masksToBounds;

/**
 * @brief 圆角方法。
 * @param cornerRadius 圆角半径
 * @param borderColor  边线颜色
 * @param borderWidth  边线宽度
 * @param masksToBounds 是否有边线
 **/
-(void)getCornerRadius:(CGFloat)cornerRadius
           borderColor:(UIColor *)borderColor
           borderWidth:(CGFloat)borderWidth
         masksToBounds:(BOOL)masksToBounds;

/**
 * @brief 设置控制器。
 **/
-(UIViewController *)setViewController;

@end
