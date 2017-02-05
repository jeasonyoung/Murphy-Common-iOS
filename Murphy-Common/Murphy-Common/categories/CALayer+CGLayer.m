//
//  CALayer+CGLayer.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/4.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "CALayer+CGLayer.h"

@implementation CALayer (CGLayer)

//设置阴影
-(void)getShadowOffset:(CGSize)shadowOffset
          shadowRadius:(CGFloat)shadowRadius
           shadowColor:(UIColor *)shadowColor
         shadowOpacity:(CGFloat)shadowOpacity
          cornerRadius:(CGFloat)cornerRadius
         masksToBounds:(BOOL)masksToBounds{
    
    self.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:shadowRadius].CGPath;
    self.shadowOffset = shadowOffset;//设置阴影的偏移量
    self.shadowRadius = shadowRadius;//设置阴影的半径
    self.shadowColor  = shadowColor.CGColor;//设置阴影的颜色为黑色
    self.shadowOpacity = shadowOpacity;//设置阴影的不透明度
    self.cornerRadius = cornerRadius;
    self.masksToBounds = masksToBounds;
}

//设置圆角
-(void)getCornerRadius:(CGFloat)cornerRadius
           borderColor:(UIColor *)borderColor
           borderWidth:(CGFloat)borderWidth
         masksToBounds:(BOOL)masksToBounds{
    
    self.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius].CGPath;
    self.cornerRadius = cornerRadius;
    self.borderColor = borderColor.CGColor;
    self.borderWidth = borderWidth;
    self.masksToBounds = masksToBounds;
}

@end
