//
//  MXTextView.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/1/31.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MXTextView.h"

@interface MXTextView(){
    NSMutableArray *_insetsHeight;
}
@end

@implementation MXTextView

//覆盖父类委托属性处理
@synthesize delegate = _delegate;

//初始化
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];//重置背景色
        
        _insetsHeight = [NSMutableArray array];
        UIView *v = [[UIView alloc] init];
        CGRect rect = v.frame;
        rect.size.height = 20;
        [v setFrame:rect];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 100, 20)];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [btn setImage:[UIImage imageNamed:@"MXTextField_Normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"MXTextField_Highlight"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(hideKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:btn];
        
        [self setInputAccessoryView:v];
    }
    return self;
}

//隐藏键盘事件
-(void)hideKeyBoard:(id)sender{
    [self resignFirstResponder];
}

//重载布局子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    //
    if([self.delegate respondsToSelector:@selector(calculateInsetHeight)] && [self.delegate conformsToProtocol:@protocol(MXTextViewDelegate)]){
        [self.delegate calculateInsetHeight];
    }
}

//重载设置frame
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
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
