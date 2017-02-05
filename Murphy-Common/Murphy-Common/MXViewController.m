//
//  BaseViewController.m
//  common
//
//  Created by jeasonyoung on 2017/1/22.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MXViewController.h"

#import "MXNavigationBar.h"
#import "UIView+Toast.h"
#import "MBProgressHUD.h"

#include "MXHeader.h"

@interface MXViewController (){
    MBProgressHUD *progress;
}
@end

@implementation MXViewController

-(instancetype)initWithParameters:(id)parameters{
    if(self = [super init]){
        _parameters = parameters;
    }
    return self;
}

-(instancetype)initWithLoginSuccess:(SuccessLoginBlock)success{
    if(self = [super init]){
        _successLogin = success;
    }
    return self;
}

-(void)loadView{
    [super loadView];
    NSNotificationAdd(self, refreshWithViews, refresh_with_views, nil);
    self.view.backgroundColor = bg_color_white;
}

-(void)refreshWithViews{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加网络观察者
    NSNotificationAdd(self,(networkStatusMonitorNotice:),kNotificationNetworkingStatusChange,nil);
    //
    [self setUpViews];
    [self setUpDatas];
}

-(void)setUpViews{
    
}

-(void)setUpDatas{
    
}

-(void)networkStatusMonitorNotice:(id)sender{
    DLog(@"networkStatusMonitorNotice=>%@",sender);
    if([sender isKindOfClass:[NSNotification class]]){
        NSNumber *status = [((NSNotification *)sender) object];
        if(status){
            _networkStatus = status.intValue;
            DLog(@"networkStatusMonitorNotice-status=>%ld", _networkStatus);
        }
    }
}

-(void)setNavigationBarHidden:(BOOL)navigationBarHidden{
    [self.navigationController setNavigationBarHidden:navigationBarHidden animated:YES];
}

-(void)pushViewController:(UIViewController *)viewController{
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)pushAnimated:(UIViewController *)viewController{
    [self.navigationController pushViewController:viewController animated:NO];
    [self addRippleEffectAnimated];
}

-(void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)popAnimated{
    [self.navigationController popViewControllerAnimated:NO];
    [self addRippleEffectAnimated];
}

-(void)addRippleEffectAnimated{
    UIApplication *app  = [UIApplication sharedApplication];
    CATransition *trans = [CATransition animation];
    trans.type = @"rippleEffect";
    trans.subtype = kCATransitionFromRight;
    [app.delegate.window.layer addAnimation:trans forKey:nil];
}

-(void)presentViewController:(UIViewController *)viewController{
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:viewController animated:YES completion:^(){}];
}

-(void)dismissViewController{
    [self dismissViewControllerAnimated:YES completion:^(){}];
}

-(void)addNavigationWithPushController:(UIViewController *)viewController{
    UINavigationController *nav = [[UINavigationController alloc] initWithNavigationBarClass:[MXNavigationBar class]
                                                                                toolbarClass:nil];
    nav.viewControllers = @[viewController];
    [self pushViewController:nav];
}

-(void)addNavigationWithPresentController:(UIViewController *)viewController{
    UINavigationController *nav = [[UINavigationController alloc] initWithNavigationBarClass:[MXNavigationBar class]
                                                                                toolbarClass:nil];
    nav.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                         target:self
                                                                                         action:@selector(back)];
    nav.viewControllers = @[viewController];
    nav.navigationBarHidden = YES;
    [self presentViewController:nav];
}

-(void)back{
    [self dismissViewController];
}

-(void)alterTitle:(NSString *)alertTitle message:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:alert_cancel_button_title
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController];//模态弹出
}

-(void)showProgressView{
    if(progress){
        [progress hideAnimated:NO];
        progress = nil;
    }
    //构建对象
    progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progress.mode = MBProgressHUDModeIndeterminate;
    progress.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    progress.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
}

-(void)hideProgressView{
    if(progress){
        [progress hideAnimated:YES afterDelay:2];
    }
}

-(void)makeToast:(NSString *)message{
    [self.view makeToast:message];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gotoLogingWithSuccess:(void (^)(BOOL))success class:(NSString *)className{
    Class clazz = NSClassFromString(className);
    if(!clazz){
        DLog(@"NSClassFromString-%@=>error!", className)
        return;
    }
    if(![self.navigationController.topViewController isKindOfClass:[clazz class]]){
        void (^GotoLogingWithSuccess)(BOOL isSuccess) = success;
        id login = [[clazz alloc] initWithLoginSuccess:^(UIViewController *viewController, BOOL isSuccess) {
            [viewController dismissViewControllerAnimated:YES completion:^{
                GotoLogingWithSuccess(isSuccess);
            }];
        }];
        [self presentViewController:login];
    }
}

-(void)dealloc{
    DLog(@"dealloc=%@", self);
    [[NSNotificationCenter defaultCenter] removeObserver:self];//移除所有观察者
}

#pragma mark - 取消一切编辑事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
