//
//  BaseViewController.h
//  common
//
//  Created by jeasonyoung on 2017/1/22.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXNetworkStatus.h"

/**
 * @brief 登录处理回调函数。
 * @param viewController 当前控制器。
 * @param isSuccess 是否成功。
 **/
typedef void (^SuccessLoginBlock)(UIViewController *viewController, BOOL isSuccess);

/**
 * @brief 控制器基础类。
 **/
@interface BaseViewController : UIViewController

/**
 * @brief 登录处理回调函数。
 **/
@property(nonatomic, copy) SuccessLoginBlock successLogin;

/**
 * @brief 调用传递的参数。
 **/
@property(nonatomic, strong) id parameters;

/**
 * @brief 当前网络状态。
 **/
@property(readonly,assign)MXNetworkStatus networkStatus;

/**
 * @brief 初始化。
 * @param parameters 初始化参数。
 **/
-(instancetype)initWithParameters:(id)parameters;

/**
 * @brief 初始化子视图。
 **/
-(void)setUpViews;

/**
 * @brief 初始化数据。
 **/
-(void)setUpDatas;

/**
 * @brief 调用登录界面。
 * @param success 登录成功回调。
 * @return 返回self。
 */
-(instancetype)initWithLoginSuccess:(SuccessLoginBlock)success;

/**
 * @brief 调用登录界面。
 * @param success 登录成功回调。
 * @param className 登录界面的ViewController名称。
 */
-(void)gotoLogingWithSuccess:(void(^)(BOOL isSuccess))success class:(NSString *)className;

/**
 * @brief 设置是否隐藏navigationBar。
 * @param navigationBarHidden 是否隐藏。
 **/
-(void)setNavigationBarHidden:(BOOL)navigationBarHidden;

/**
 * @brief 简化push。
 * @param viewController 要push到的界面。
 **/
-(void)pushViewController:(UIViewController *)viewController;

/**
 * @brief 动画push到下层界面。
 * @param viewController 要push到的界面。
 **/
-(void)pushAnimated:(UIViewController *)viewController;

/**
 * @brief 返回上一界面。
 **/
-(void)popViewController;

/**
 * @brief 动画返回上一界面。
 **/
-(void)popAnimated;

/**
 * @brief present简化。
 * @param viewController 要present的界面。
 **/
-(void)presentViewController:(UIViewController *)viewController;

/**
 * @brief dismiss简化。
 **/
-(void)dismissViewController;

/**
 * @brief alert简化。
 * @param alertTitle 标题。
 * @param message 消息内容。
 **/
-(void)alterTitle:(NSString *)alertTitle message:(NSString *)message;

/**
 * @brief 加上导航条push到下个界面。
 * @param viewController 要push的界面。
 **/
-(void)addNavigationWithPushController:(UIViewController *)viewController;

/**
 * @brief 加上导航条present到界面。
 * @param viewController 要present到的界面。
 **/
-(void)addNavigationWithPresentController:(UIViewController *)viewController;

/**
 * @brief 弱提示。
 * @param message 弱提示消息内容。
 **/
-(void)makeToast:(NSString *)message;

/**
 * @brief 显示进度条。
 **/
-(void)showProgressView;

/**
 * @brief 隐藏进度条。
 **/
-(void)hideProgressView;

/**
 * @brief 界面刷新(登录、注销)。
 **/
-(void)refreshWithViews;

@end
