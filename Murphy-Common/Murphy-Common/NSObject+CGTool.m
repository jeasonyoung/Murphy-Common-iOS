//
//  NSObject+CGTool.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/6.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "NSObject+CGTool.h"
#import <objc/runtime.h>
#import "MXHeader.h"

char * const ASSOCIATION_OBJ_DATA = "ASSOCIATION_OBJ_DATA";

@implementation NSObject (CGTool)

#pragma mark -- 设置绑定数据
-(void)setBindingData:(id)bindingData{
    objc_setAssociatedObject(self, ASSOCIATION_OBJ_DATA, bindingData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -- 获取绑定数据
-(id)bindingData{
    id data = objc_getAssociatedObject(self, ASSOCIATION_OBJ_DATA);
    return data;
}

#pragma mark -- 计算字符串尺寸
+(CGSize)getSizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    if(text && text.length){
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                             attributes:@{NSFontAttributeName:font}];
        CGRect rect = [attributedText boundingRectWithSize:maxSize
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        return rect.size;
    }
    return CGSizeZero;
}

#pragma mark -- 适配图片尺寸
+(CGSize)adaptiveWithImage:(UIImage *)image maxHeight:(CGFloat)maxHeight maxWidth:(CGFloat)maxWidth{
    CGSize imageSize = image.size;
    CGFloat height = 0, width = 0;
    CGFloat imgHW = imageSize.height / imageSize.width,
            maxHW = maxHeight / maxWidth;
    if(imgHW > maxHW){
        height = maxHeight;
        width  = height * imageSize.width / imageSize.height;
    }else if(imgHW < maxHW){
        width  = maxWidth;
        height = imageSize.height * width / imageSize.width;
    }else if(imgHW == maxHW){
        height = maxHeight;
        width  = maxWidth;
    }
    return CGSizeMake(width, height);
}

#pragma mark -- html颜色转换
+(UIColor *)hexStringToColor:(NSString *)hex{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if([cString length] != 6) return [UIColor blackColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rStr = [cString substringWithRange:range];
    range.location = 2;
    NSString *gStr = [cString substringWithRange:range];
    range.location = 4;
    NSString *bStr = [cString substringWithRange:range];
    //
    int r,g,b;
    [[NSScanner scannerWithString:rStr] scanInt:&r];
    [[NSScanner scannerWithString:gStr] scanInt:&g];
    [[NSScanner scannerWithString:bStr] scanInt:&b];
    return RGBA(r, g, b, 1.0f);
}

#pragma mark -- 截图
+(UIImage *)getImageFromView:(UIView *)view rangRect:(CGRect)rect{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGImageRef imageRef = image.CGImage;
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    UIGraphicsEndImageContext();
    
    return sendImage;
}

#pragma mark -- 存储空间
+(NSString *)usedSpaceAndFreeSpace{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSDictionary *fileSysAttr = [fileMgr attributesOfFileSystemForPath:path error:nil];
    NSNumber *freeSpace  = [fileSysAttr objectForKey:NSFileSystemFreeSize];
    NSNumber *totalSpace = [fileSysAttr objectForKey:NSFileSystemSize];
    
    CGFloat hasSpace = ([totalSpace longLongValue] - [freeSpace longLongValue])/1024.0/1024.0/1024.0;
    CGFloat fSpace   = [freeSpace longLongValue]/1024.0/1024.0/1024.0;
    
    return [NSString stringWithFormat:@"已占用%0.1fG/剩余%0.1fG", hasSpace, fSpace];
}

@end
