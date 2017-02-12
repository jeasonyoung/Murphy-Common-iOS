//
//  MBProgressHUD+Ext.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/12.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MBProgressHUD+Ext.h"

//实现
@implementation MBProgressHUD (Ext)

#pragma mark -- 显示icon消息
+(void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view{
    if(view == nil) view = [UIApplication sharedApplication].keyWindow;
    //快速显示一个提示消息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;//显示内容
    //设置图片
    if(icon && icon.length){
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"hud-%@",icon]];
        hud.customView = [[UIImageView alloc] initWithImage:img];
        hud.mode = MBProgressHUDModeCustomView;
    }else{
        hud.mode = MBProgressHUDModeText;
    }
    //隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //1秒之后再消失
    [hud hideAnimated:YES afterDelay:0.9];
}

#pragma mark 显示错误信息
+(void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error" view:view];
}

#pragma mark 显示成功消息
+(void)showSuccess:(NSString *)success toView:(UIView *)view{
    [self show:success icon:@"success" view:view];
}

#pragma mark 显示消息
+(MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view{
    //显示提示消息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;//显示消息内容
    //隐藏时从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    //
    return hud;
}

#pragma mark 显示文本
+(void)showText:(NSString *)text toView:(UIView *)view{
    [self show:text icon:nil view:view];
}

@end
