//
//  MBProgressHUD+Ext.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/12.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

/**
 * @brief 扩展。
 **/
@interface MBProgressHUD (Ext)

/**
 * @brief 显示成功信息到View。
 * @param success 成功消息。
 * @param view View。
 **/
+(void)showSuccess:(NSString *)success toView:(UIView *)view;

/**
 * @brief 显示错误消息到View。
 * @param error 错误消息。
 * @param view View。
 **/
+(void)showError:(NSString *)error toView:(UIView *)view;

/**
 * @brief 显示消息到View。
 * @param message 显示消息内容。
 * @param view View。
 * @return MBProgressHUD对象。
 **/
+(MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

/**
 * @brief 显示文本消息到View。
 * @param text 文本内容。
 * @param view View。
 **/
+(void)showText:(NSString *)text toView:(UIView *)view;

@end
