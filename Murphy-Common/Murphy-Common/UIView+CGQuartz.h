//
//  UIView+CGQuartz.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/5.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * @brief Cell样式
 **/
typedef NS_ENUM(NSInteger,CellStyle){
    /**
     * @brief 上部分背景
     **/
    CellStyleUp = 0,
    /**
     * @brief 中间背景
     **/
    CellStyleCenter,
    /**
     * @brief 下部背景
     **/
    CellStyleDown,
    /**
     * @brief 独体Cell背景
     **/
    CellStyleRound
};

@interface UIView (CGQuartz)

/**
 * @brief 画线条
 * @param rect 绘制范围
 * @param start 起点
 * @param end   终点
 * @param lineColor 线条颜色
 * @param lineWidth 线条宽度
 **/
-(void)drawRectWithLine:(CGRect)rect
                  start:(CGPoint)start
                    end:(CGPoint)end
              lineColor:(UIColor *)lineColor
              lineWidth:(CGFloat)lineWidth;

/**
 * @brief 绘制泡泡框
 * @param rect 绘制范围
 * @param lineColor 线条颜色
 * @param radius 半径
 **/
-(void)drawRectRoundMark:(CGRect)rect
               lineColor:(UIColor *)lineColor
              withRadius:(CGFloat)radius;

/**
 * @brief 绘制文本
 * @param text 文字
 * @param frame 绘制范围
 * @param color 文字颜色
 * @param font 文字字体
 **/
-(void)drawTextWithText:(NSString *)text
                   rect:(CGRect)frame
                  color:(UIColor *)color
                   font:(UIFont *)font;

/**
 * @brief 绘制进度条
 * @param rect 绘制范围
 * @param progress 进度
 * @param progressTintColor 进度颜色
 * @param trackTintColor 背景颜色
 * @param lineWidth 线条宽度
 * @param lineColor 线条颜色
 * @param radius 半径
 **/
-(void)drawRectRoundProgress:(CGRect)rect
                    progress:(CGFloat)progress
           progressTintColor:(UIColor *)progressTintColor
              trackTintColor:(UIColor *)trackTintColor
                   lineWidth:(CGFloat)lineWidth
                   lineColor:(UIColor *)lineColor
                  withRadius:(CGFloat)radius;

/**
 * @brief 绘制圆形
 * @param center 圆心
 * @param radius 半径
 * @param width 宽度
 * @param color 颜色
 * @param fillColor 填充色
 * @param shadowSize 阴影尺寸
 **/
-(void)drawCircleWithCenter:(CGPoint)center
                     radius:(CGFloat)radius
                      width:(CGFloat)width
                      color:(UIColor *)color
                  fillColor:(UIColor *)fillColor
                 shadowSize:(CGSize)shadowSize;

/**
 * @brief 绘制圆角矩形
 * @param rect 矩形范围
 * @param inset 间距
 * @param radius 半径
 * @param lineWidth 线宽
 * @param lineColor 线色
 * @param backgroundColor 背景色
 **/
-(void)drawWithChamferOfRectangle:(CGRect)rect
                            inset:(UIEdgeInsets)inset
                           radius:(CGFloat)radius
                        lineWidth:(CGFloat)lineWidth
                        lineColor:(UIColor *)lineColor
                  backgroundColor:(UIColor *)backgroundColor;

/**
 * @brief 绘制圆角cell背景
 * @param rect 绘制范围
 * @param cellStyle 背景类型
 * @param inset 间隔
 * @param radius 半径
 * @param lineWidth 线宽
 * @param lineColor 线色
 * @param backgroundColor 背景色
 **/
-(void)drawCellWithRound:(CGRect)rect
                cellStyle:(CellStyle)cellStyle
                    inset:(UIEdgeInsets)inset
                   radius:(CGFloat)radius
                lineWidth:(CGFloat)lineWidth
                lineColor:(UIColor *)lineColor
          backgroundColor:(UIColor *)backgroundColor;

@end
