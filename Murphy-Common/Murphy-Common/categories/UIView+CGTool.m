//
//  UIView+CGTool.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/4.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "UIView+CGTool.h"
#import "CALayer+CGLayer.h"

//实现
@implementation UIView (CGTool)

//设置阴影
-(void)getShadowOffset:(CGSize)shadowOffset
          shadowRadius:(CGFloat)shadowRadius
           shadowColor:(UIColor *)shadowColor
         shadowOpacity:(CGFloat)shadowOpacity
          cornerRadius:(CGFloat)cornerRadius
         masksToBounds:(BOOL)masksToBounds{
    //
    [self.layer getShadowOffset:shadowOffset
                   shadowRadius:shadowRadius
                    shadowColor:shadowColor
                  shadowOpacity:shadowOpacity
                   cornerRadius:cornerRadius
                  masksToBounds:masksToBounds];
}

//设置圆角
-(void)getCornerRadius:(CGFloat)cornerRadius
           borderColor:(UIColor *)borderColor
           borderWidth:(CGFloat)borderWidth
         masksToBounds:(BOOL)masksToBounds{
    //
    [self.layer getCornerRadius:cornerRadius
                    borderColor:borderColor
                    borderWidth:borderWidth
                  masksToBounds:masksToBounds];
}

//设置视图控制器
-(UIViewController *)setViewController{
    UIResponder *nextResponder = nil;
    for(UIView *next = self.superview; next; next = next.superview){
        nextResponder = next.nextResponder;
        if([nextResponder isKindOfClass:[UIViewController class]]){
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
