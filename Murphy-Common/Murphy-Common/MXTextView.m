//
//  MXTextView.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/1/31.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MXTextView.h"
#import "Masonry.h"

@interface MXTextView()

//
@property(strong, nonatomic)UIButton *btnDropdown;
//
@property(strong, nonatomic)UIView *accessoryView;

@end

@implementation MXTextView

//覆盖父类委托属性处理
@synthesize delegate = _delegate;

#pragma mark --========== start 属性 =================

-(UIButton *)btnDropdown{
    if(!_btnDropdown){
        _btnDropdown = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnDropdown setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_btnDropdown setImage:[UIImage imageNamed:@"MXTextField_Normal"] forState:UIControlStateNormal];
        [_btnDropdown setImage:[UIImage imageNamed:@"MXTextField_Highlight"] forState:UIControlStateHighlighted];
        [_btnDropdown addTarget:self action:@selector(hideKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnDropdown;
}

-(UIView *)accessoryView{
    if(!_accessoryView){
        _accessoryView = [[UIView alloc] init];
    }
    return _accessoryView;
}

#pragma mark --========== end   属性 =================


//隐藏键盘事件
-(void)hideKeyBoard:(id)sender{
    [self resignFirstResponder];
}

//重载布局子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    //
    self.inputAccessoryView = self.accessoryView;
    [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@0);
        make.left.mas_equalTo(@0);
        make.height.equalTo(self.mas_height);
    }];
    //
    [self.accessoryView addSubview:self.btnDropdown];
    [self.btnDropdown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@0);
        make.left.mas_equalTo(@10);
        
    }];
    
    //
    if([self.delegate respondsToSelector:@selector(calculateInsetHeight)] && [self.delegate conformsToProtocol:@protocol(MXTextViewDelegate)]){
        [self.delegate calculateInsetHeight];
    }
}

//设置文本内容
-(void)setText:(NSString *)text{
    [super setText:text];
}

//设置内容尺寸
-(void)setContentSize:(CGSize)contentSize{
    [super setContentSize:contentSize];
}

//资源回收
-(void)dealloc{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
