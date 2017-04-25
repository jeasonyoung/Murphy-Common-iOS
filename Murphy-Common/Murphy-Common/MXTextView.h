//
//  MXTextView.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/1/31.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MXTextView;
/**
 * @brief 文本视图委托。
 **/
@protocol MXTextViewDelegate<UITextViewDelegate>

@optional
/**
 * @brief 内容高度。
 * @param textView 文本输入。
 * @param textHeigh 文本高度。
 **/
- (void)textView:(MXTextView *)textView heightWithContent:(CGFloat)textHeigh;
/**
 * @brief 计算inset高度。
 **/
- (void)calculateInsetHeight;
@end

/**
 * @brief 文本视图。
 **/
@interface MXTextView : UITextView{
    NSTimeInterval _animationDuration;
    UIViewAnimationCurve _animationCurve;
    CGRect _keyboardEndFrame;
    BOOL _isShow;
}

/**
 * @brief 委托代理。
 **/
@property(assign, nonatomic) id<MXTextViewDelegate> delegate;

@end
