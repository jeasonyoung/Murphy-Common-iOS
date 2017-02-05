//
//  Header.h
//  common
//
//  Created by jeasonyoung on 2017/1/23.
//  Copyright © 2017年 ipower. All rights reserved.
//

#ifndef Murphy_Common_Header_h
#define Murphy_Common_Header_h


//#define kUserDefaults [NSUserDefaults standardUserDefaults];

#define defaultInset  UIEdgeInsetsMake(5, 10, 5, 10)
#define kDefaultInset UIEdgeInsetsMake(8, 10, 8, 10)


//color
#define bg_color_clear [UIColor clearColor]
#define bg_color_white [UIColor whiteColor]
#define text_color_white [UIColor whiteColor]

/**
 * @brief 与蓝色导航条一样的颜色。
 **/
#define RGBA(r,g,b,a)	[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a] //RGB颜色

/**
 * @brief 蓝色。
 **/
#define color_blue RGBA(43, 189, 188, 1) //蓝色
/**
 * @brief 绿色。
 **/
#define color_green RGBA(137,177,50,1) //绿色
/**
 * @brief 灰色。
 **/
#define color_gray RGBA(160, 160, 160, 1) // 灰色
/**
 * @brief 黑色。
 **/
#define color_black RGBA(110, 110, 110, 1) //黑色
/**
 * @brief 紫色。
 **/
#define color_dark_purple RGBA(68, 60, 114, 1) // 紫色
/**
 * @brief 淡紫色。
 **/
#define color_light_purple RGBA(179,171,211,1) // 淡紫色
/**
 * @brief 透明紫色。
 **/
#define color_alpha_blue RGBA(43,189,188,.5) //透明紫色
#define color_purple RGBA(75, 55, 103, 1)

/**
 * @brief 粉红紫色。
 **/
#define color_pink RGBA(186, 59, 119, 1) //粉红
/**
 * @brief 淡粉红。
 **/
#define color_light_pink RGBA(192,148,219,1) //淡粉红

#define loading_text @"正在拉取数据"

//font
#define font_nav_title [UIFont boldSystemFontOfSize:19]
//
#define Font(fontSize) [UIFont systemFontOfSize:fontSize]

//
#define refresh_with_views @"refreshWithViews"
#define alert_cancel_button_title @"我知道了"

//notification-type
//网络状态变更状态
#define kNotificationNetworkingStatusChange @"k_notification_networking_change_status"

//notification
#define NSNotificationAdd(_server,_sel,_name,_obj) [[NSNotificationCenter defaultCenter] addObserver:_server selector:@selector(_sel) name:_name object:_obj]
#define NSNotificationPost(_name,_obj,_info) [[NSNotificationCenter defaultCenter] postNotificationName:_name object:_obj userInfo:_info]


#ifdef DEBUG
# define DLog(format, ...) NSLog((@"[文件名:%s]" "[函数名:%s]" "[行号:%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif



#endif /* Header_h */
