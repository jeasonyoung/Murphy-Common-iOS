//
//  MXInputView.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/4.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MXInputView.h"
#import "MXHeader.h"

//扩展成员变量
@interface MXInputView (){
    CGFloat _selfMinY;
}
@end
//实现
@implementation MXInputView

//初始化
-(instancetype)initWithFrame:(CGRect)frame success:(void (^)())success{
    if(self = [super initWithFrame:frame]){
        _success = success;
        _selfMinY = CGRectGetMinY(frame);
        [self layoutSubviews];
        [self notificationCenter];
    }
    return self;
}

//设置左边标题
-(UILabel *)setLeftTitle:(NSString *)title{
    UILabel *label = [UILabel new];
    label.font = Font(17);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    label.textColor = color_black;
    [label sizeToFit];
    return label;
}

//重载布局子视图
-(void)layoutSubviews{
    
}

#pragma mark - 初始化通知
-(void)notificationCenter{
    //键盘调用事件
    NSNotificationAdd(self, keyboardWasShow:, UIKeyboardWillShowNotification, nil);
    //键盘隐藏事件
    NSNotificationAdd(self, keyboardWasHidden:, UIKeyboardWillHideNotification, nil);
}

//键盘调用事件
-(void)keyboardWasShow:(NSNotification *)notification{
    [self moveTextViewForKeyboard:notification up:YES];
}

//键盘隐藏事件
-(void)keyboardWasHidden:(NSNotification *)notification{
    [self moveTextViewForKeyboard:notification up:NO];
}

//
-(void)moveTextViewForKeyboard:(NSNotification *)aNotification up:(BOOL)up{
    NSDictionary *userInfo = [aNotification userInfo];
    //Get Animation info from userInfo
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&_animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&_animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&_keyboardEndFrame];
    _isShow = up;
    if(up){
        [self calculateInsetHeight];
    }else{
        self.transform = CGAffineTransformIdentity;
    }
}

//计算插入高度
-(void)calculateInsetHeight{
    if(!_isShow)return;
    CGRect rect = [self.window convertRect:_keyboardEndFrame toView:self.superview];
    CGFloat insetHeight =  CGRectGetMaxY(_currentField.frame) + _selfMinY - CGRectGetMinY(rect);
    if(insetHeight > 0){
        self.transform = CGAffineTransformMakeTranslation(0, -insetHeight);
    }
}

#pragma mark - 重载
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if(_currentField) _currentField = nil;
    _currentField = textField;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(_currentField) _currentField = nil;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if(_currentField) _currentField = nil;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if(_currentField) _currentField = nil;
    _currentField = textView;
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(1 == range.length) return YES;//按下回格键
    if([text isEqualToString:@"\n"]){//按下return键
        //这里隐藏键盘，不做任何处理
        [textView resignFirstResponder];
        _success();
        return NO;
    }else{
        if([textView.text length] <= 200){//判断字符个数
            return YES;
        }
    }
    return NO;
}


//资源回收
-(void)dealloc{
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
