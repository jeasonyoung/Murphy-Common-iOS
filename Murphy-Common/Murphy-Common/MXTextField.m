//
//  MXTextField.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/1/30.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MXTextField.h"

@implementation MXTextField

//委托属性覆盖处理
@synthesize delegate = _delegate;

//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setClearButtonMode:UITextFieldViewModeWhileEditing];
        
        UIView *v  = [[UIView alloc] init];
        CGRect rect = v.frame;
        rect.size.height = 20;
        [v setFrame:rect];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 100, 20)];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [btn setImage:[UIImage imageNamed:@"MXTextField_Normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"MXTextField_Highlight"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(hideKeyBoard) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:btn];
        
        self.inputAccessoryView = v;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

//隐藏键盘事件处理
- (void)hideKeyBoard {
    [self resignFirstResponder];
}

//控制placeHolder
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectMake(CGRectGetMaxX(self.leftView.frame) + 7,
                      bounds.origin.y,
                      CGRectGetWidth(bounds) - (CGRectGetMaxX(self.leftView.frame) + 10),
                      CGRectGetHeight(bounds));
}

//控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectMake(CGRectGetMaxX(self.leftView.frame) + 7,
                      bounds.origin.y,
                      CGRectGetWidth(bounds) - (CGRectGetMaxX(self.leftView.frame) + 10),
                      CGRectGetHeight(bounds));
}

//控制左视图位置
- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    return CGRectMake(CGRectGetMinX(bounds) + 7,
                      (CGRectGetHeight(bounds) - CGRectGetHeight(self.leftView.frame)) / 2,
                      CGRectGetWidth(self.leftView.frame),
                      CGRectGetHeight(self.leftView.frame));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
