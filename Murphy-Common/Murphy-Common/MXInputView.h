//
//  MXInputView.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/4.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXTextField.h"
#import "MXTextView.h"

/**
 * @brief 输入面板。
 **/
@interface MXInputView : UIView<MXTextFieldDelegate,MXTextViewDelegate>{
    BOOL _isShow;
    NSTimeInterval _animationDuration;
    UIViewAnimationCurve _animationCurve;
    CGRect _keyboardEndFrame;
    UIView *_currentField;
    void (^_success)();
}

/**
 * @brief 初始化
 * @param success 成功处理函数。
 **/
-(instancetype)initWithSuccess:(void(^)())success;

/**
 * @brief 重置布局视图。
 **/
-(void)layoutSubviews;

/**
 * 设置左边标题。
 * @param title 标题。
 **/
-(UILabel *)setLeftTitle:(NSString *)title;
@end
