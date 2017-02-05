//
//  MXTextField.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/1/30.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MXTextField;

/**
 * @brief 文本输入框委托。
 **/
@protocol MXTextFieldDelegate<UITextFieldDelegate>

@optional
/**
 * @brief 插入文本高度。
 * @param txtField 文本输入框。
 * @param inset 插入高度。
 **/
-(void)textField:(MXTextField *)txtField insetWithHeight:(CGFloat)inset;
@end

/**
 * @brief 文本输入框。
 **/
@interface MXTextField : UITextField {
    NSTimeInterval _animationDuration;
    UIViewAnimationCurve _animationCurve;
    CGRect _keyboardEndFrame;
}

/**
 * @brief 事件委托。
 **/
@property(assign,nonatomic) id<MXTextFieldDelegate> delegate;

@end
