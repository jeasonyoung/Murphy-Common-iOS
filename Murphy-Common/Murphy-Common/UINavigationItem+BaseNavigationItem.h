//
//  UINavigationItem+BaseNavigationItem.h
//  common
//
//  Created by jeasonyoung on 2017/1/23.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (BaseNavigationItem)

/**
 * @brief 设置新标题。
 * @param title 新标题。
 **/
-(void)setNewTitle:(NSString *)title;

/**
 * @brief 设置右边按钮。
 * @param target 响应目标对象。
 * @param title  按钮标题。
 * @param action 响应处理。
 * @param image  按钮图片。
 * @return       按钮对象。
 **/
-(UIButton *)setRightItemWithTarget:(id)target title:(NSString *)title action:(SEL)action image:(NSString *)image;

/**
 * @brief 设置右边按钮。
 * @param view 按钮View。
 **/
-(void)setRightItemWithView:(UIView *)view;

/**
 * @brief 设置返回按钮。
 * @param target 响应目标对象。
 * @param title  按钮标题。
 * @param action 响应处理。
 * @param image  按钮图片。
 **/
-(void)setBackItemWithTarget:(id)target title:(NSString *)title action:(SEL)action image:(NSString *)image;

/**
 * @brief 设置返回按钮集合。
 * @param target  响应目标对象。
 * @param titles  按钮标题集合。
 * @param actions 响应处理集合。
 * @param images  按钮图片集合。
 **/
-(void)setBackItemWithTarget:(id)target titles:(NSArray *)titles actions:(NSArray *)actions images:(NSArray *)images;

@end
