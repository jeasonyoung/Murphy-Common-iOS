//
//  UIView+CGQuartz.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/5.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "UIView+CGQuartz.h"

@implementation UIView (CGQuartz)

#pragma mark -- 绘制线
-(void)drawRectWithLine:(CGRect)rect
                  start:(CGPoint)start
                    end:(CGPoint)end
              lineColor:(UIColor *)lineColor
              lineWidth:(CGFloat)lineWidth{
    //获取绘制上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置线宽
    CGContextSetLineWidth(context, lineWidth);
    //设置线色
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    //开始设置路径
    CGContextBeginPath(context);
    //设置起点
    CGContextMoveToPoint(context, start.x, start.y);
    //设置终点
    CGContextAddLineToPoint(context, end.x, end.y);
    //绘制完毕
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark -- 绘制气泡
-(void)drawRectRoundMark:(CGRect)rect
               lineColor:(UIColor *)lineColor
              withRadius:(CGFloat)radius{
    //设置线条颜色
    [lineColor setStroke];
    //设置填充色
    [[UIColor whiteColor] setFill];
    
    //获取绘制上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);//开始绘制
    //
    CGPoint x1,x2,x3,x4;//x为4个顶点
    CGPoint y1,y2,y3,y4,y5,y6,y7,y8;//y为4个控制点
    CGPoint z1,z2,z3;
    //从左上角顶点开始，顺时针旋转，x1->y1->y2->x2
    CGFloat minX   = CGRectGetMinX(rect),
            minY   = CGRectGetMinY(rect),
            height = CGRectGetHeight(rect),
            width  = CGRectGetWidth(rect);
    x1 = CGPointMake(minX, minY);
    x2 = CGPointMake(minX + width, minY);
    x3 = CGPointMake(minX + width, minY + height);
    x4 = CGPointMake(minX, minY + height);
    
    z1 = CGPointMake(minX + width / 2 + 3, minY + height);
    z2 = CGPointMake(minX + width / 2, minY + height + 3);
    z3 = CGPointMake(minX + width / 2 - 3, minY + height);
    
    y1 = CGPointMake(minX + radius, minY);
    y2 = CGPointMake(minX + width - radius, minY);
    y3 = CGPointMake(minX + width, minY + radius);
    y4 = CGPointMake(minX + width, minY + height - radius);
    
    y5 = CGPointMake(minX + width - radius, minY + height);
    y6 = CGPointMake(minX + radius, minY + height);
    y7 = CGPointMake(minX, minY + height - radius);
    y8 = CGPointMake(minX, minY + radius);
    
    CGContextMoveToPoint(context, y1.x, y1.y);
    CGContextAddArcToPoint(context, x2.x, x2.y, y3.x, y3.y, radius);
    CGContextAddArcToPoint(context, x3.x, x3.y, y5.x, y5.y, radius);
    CGContextAddLineToPoint(context, z1.x, z1.y);
    CGContextAddLineToPoint(context, z2.x, z2.y);
    CGContextAddLineToPoint(context, z3.x, z3.y);
    CGContextAddArcToPoint(context, x4.x, x4.y, y7.x, y7.y, radius);
    CGContextAddArcToPoint(context, x1.x, x1.y, y1.x, y1.y, radius);
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark -- 绘制文本
-(void)drawTextWithText:(NSString *)text
                   rect:(CGRect)frame
                  color:(UIColor *)color
                   font:(UIFont *)font{
    //
    [text drawInRect:(text.length ? frame : CGRectZero)
      withAttributes:@{
                       NSFontAttributeName:font,
                       NSForegroundColorAttributeName: color
                      }];
}

#pragma mark -- 绘制圆角进度条
-(void)drawRectRoundProgress:(CGRect)rect
                    progress:(CGFloat)progress
           progressTintColor:(UIColor *)progressTintColor
              trackTintColor:(UIColor *)trackTintColor
                   lineWidth:(CGFloat)lineWidth
                   lineColor:(UIColor *)lineColor
                  withRadius:(CGFloat)radius{
    //
    [trackTintColor setFill];
    [lineColor setStroke];//设置线条颜色
    //获取绘制上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);//开始绘制
    CGContextSetLineWidth(context, lineWidth);//设置线宽
    CGContextMoveToPoint(context, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect));
    //绘制背景
    CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMaxX(rect) - radius, CGRectGetMaxY(rect), radius);
    CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMinX(rect) + radius, CGRectGetMinY(rect), radius);
    CGContextClosePath(context);//关闭绘制
    CGContextDrawPath(context, kCGPathFillStroke);//填充
    //绘制进度条
    [progressTintColor setFill];
    [progressTintColor setStroke];//设置线条颜色
    CGFloat minX = CGRectGetMinX(rect) + lineWidth,
            minY = CGRectGetMinY(rect) + lineWidth,
            maxX = minX + (CGRectGetWidth(rect) - lineWidth * 2) * progress,
            maxY = CGRectGetMaxY(rect) - lineWidth,
            trackRadius =  radius - lineWidth;
    CGContextMoveToPoint(context, minX + trackRadius, minY);
    CGContextAddArcToPoint(context, maxX, minY, maxX, maxY, trackRadius);
    CGContextAddArcToPoint(context, maxX, maxY, maxX - trackRadius, maxY, trackRadius);
    CGContextAddArcToPoint(context, minX, maxY, minX, minY, trackRadius);
    CGContextAddArcToPoint(context, minX, minY, minX + trackRadius, minY, trackRadius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark -- 绘制圆形
-(void)drawCircleWithCenter:(CGPoint)center
                     radius:(CGFloat)radius
                      width:(CGFloat)width
                      color:(UIColor *)color
                  fillColor:(UIColor *)fillColor
                 shadowSize:(CGSize)shadowSize{
    //上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddArc(pathRef,
                 &CGAffineTransformIdentity,
                 center.x,
                 center.y,
                 radius,
                 M_PI/2,
                 radius * 2 * M_PI - M_PI/2,
                 NO);
    //
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextSetShadowWithColor(context, shadowSize, 1, color.CGColor);
    CGContextAddPath(context, pathRef);
    CGPathCloseSubpath(pathRef);
    //
    CGContextDrawPath(context, kCGPathFillStroke);
    CGPathRelease(pathRef);
}

#pragma mark -- 绘制圆角矩形
-(void)drawWithChamferOfRectangle:(CGRect)rect
                            inset:(UIEdgeInsets)inset
                           radius:(CGFloat)radius
                        lineWidth:(CGFloat)lineWidth
                        lineColor:(UIColor *)lineColor
                  backgroundColor:(UIColor *)backgroundColor{
    //获取绘制上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);//开始绘制
    CGFloat minX = CGRectGetMinX(rect) + inset.left,
            minY = CGRectGetMinY(rect) + inset.top,
            maxX = CGRectGetMaxX(rect) - inset.right,
            maxY = CGRectGetMaxY(rect) - inset.bottom;
    
    CGPoint x1,x2,x3,x4;//4个定点
    CGPoint y1,y2,y3,y4,y5,y6,y7,y8;//8个控制点
    
    x1 = CGPointMake(minX, minY);
    x2 = CGPointMake(maxX, minY);
    x3 = CGPointMake(maxX, maxY);
    x4 = CGPointMake(minX, maxY);
    
    y1 = CGPointMake(minX + radius, minY);
    y2 = CGPointMake(maxX - radius, minY);
    y3 = CGPointMake(maxX, minY + radius);
    y4 = CGPointMake(maxX, maxY - radius);
    y5 = CGPointMake(maxX - radius, maxY);
    y6 = CGPointMake(minX + radius, maxY);
    y7 = CGPointMake(minX, maxY - radius);
    y8 = CGPointMake(minX, minY + radius);
    
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextSetLineWidth(context, lineWidth);
    CGContextMoveToPoint(context, y1.x, y1.y);
    CGContextAddArcToPoint(context, x2.x, x2.y, y3.x, y3.y, radius);
    CGContextAddArcToPoint(context, x3.x, x3.y, y5.x, y5.y, radius);
    CGContextAddArcToPoint(context, x4.x, x4.y, y7.x, y7.y, radius);
    CGContextAddArcToPoint(context, x1.x, x1.y, y1.x, y1.y, radius);
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark -- 绘制cell
-(void)drawCellWithRound:(CGRect)rect
               cellStyle:(CellStyle)cellStyle
                   inset:(UIEdgeInsets)inset
                  radius:(CGFloat)radius
               lineWidth:(CGFloat)lineWidth
               lineColor:(UIColor *)lineColor
         backgroundColor:(UIColor *)backgroundColor{
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    //
    CGFloat minX, minY, maxX, maxY;
    UIBezierPath *path;
    switch(cellStyle){
        case CellStyleUp:{//
            minX = CGRectGetMinX(rect) + inset.left;
            minY = CGRectGetMinY(rect) + inset.top;
            maxX = CGRectGetWidth(rect) - inset.right;
            maxY = CGRectGetHeight(rect);
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(minX, minY, maxX - minX, maxY - minY)
                                         byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                               cornerRadii:CGSizeMake(radius, radius)];
            break;
        }
        case CellStyleCenter:{//
            minX = CGRectGetMinX(rect) + inset.left;
            minY = CGRectGetMinY(rect);
            maxX = CGRectGetMaxX(rect) - inset.right;
            maxY = CGRectGetMaxY(rect);
            path = [UIBezierPath bezierPathWithRect:CGRectMake(minX, minY, maxX - minX, maxY - minY)];
            break;
        }
        case CellStyleDown:{//
            minX = CGRectGetMinX(rect) + inset.left;
            minY = CGRectGetMinY(rect);
            maxX = CGRectGetWidth(rect) - inset.right;
            maxY = CGRectGetHeight(rect) - inset.bottom;
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(minX, minY, maxX - minX, maxY - minY)
                                         byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                               cornerRadii:CGSizeMake(radius, radius)];
            break;
        }
        case CellStyleRound:{//
            minX = CGRectGetMinX(rect) + inset.left;
            minY = CGRectGetMinY(rect) + inset.top;
            maxX = CGRectGetWidth(rect) - inset.right;
            maxY = CGRectGetHeight(rect) - inset.bottom;
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(minX, minY, maxX - minX, maxY - minY)
                                         byRoundingCorners:UIRectCornerAllCorners
                                               cornerRadii:CGSizeMake(radius, radius)];
            break;
        }
        default:break;
    }
    [path stroke];
    [path fill];
    [path closePath];
}

@end
