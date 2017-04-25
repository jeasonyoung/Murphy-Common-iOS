//
//  UINavigationItem+BaseNavigationItem.m
//  common
//
//  Created by jeasonyoung on 2017/1/23.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "UINavigationItem+BaseNavigationItem.h"

#import "MXNavBarButtonItem.h"

#include "MXHeader.h"

#import "Masonry.h"

@interface UINavigationItem (){
    UILabel *_lbTitle;
}
@end

@implementation UINavigationItem (BaseNavigationItem)

-(void)setNewTitle:(NSString *)title{
    if(!_lbTitle){
        _lbTitle = [UILabel new];
        //_lbTitle.frame = CGRectMake(0, 0, 22, 22);
        _lbTitle.backgroundColor = bg_color_clear;
        _lbTitle.font = font_nav_title;
        _lbTitle.textColor = text_color_white;
        _lbTitle.textAlignment = NSTextAlignmentCenter;
    }
    _lbTitle.text = title;
    self.titleView = _lbTitle;
}

-(UIButton *)setRightItemWithTarget:(id)target title:(NSString *)title action:(SEL)action image:(NSString *)image{
    MXNavBarButtonItem *btnItem = [MXNavBarButtonItem itemWithTarget:target title:title action:action image:image];
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnItem.button];
    return btnItem.button;
}

-(void)setRightItemWithView:(UIView *)view{
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
}

-(void)setBackItemWithTarget:(id)target title:(NSString *)title action:(SEL)action image:(NSString *)image{
    MXNavBarButtonItem *btnItem = [MXNavBarButtonItem itemWithTarget:target title:title action:action image:image];
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnItem.button];
}

-(void)setBackItemWithTarget:(id)target titles:(NSArray *)titles actions:(NSArray *)actions images:(NSArray *)images{
    MXNavBarButtonItem *btnItem = [MXNavBarButtonItem itemWithTarget:target titles:titles actions:actions images:images];
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnItem.view];
}

@end
