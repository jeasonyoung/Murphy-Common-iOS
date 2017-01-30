//
//  BaseNavBarButtonItem.h
//  common
//
//  Created by jeasonyoung on 2017/1/23.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXNavBarButtonItem : NSObject

+(instancetype)itemWithTarget:(id)target title:(NSString *)title action:(SEL)action image:(NSString *)image;

+(instancetype)itemWithTarget:(id)target titles:(NSArray *)titles actions:(NSArray *)actions images:(NSArray *)images;

@property(readonly,nonatomic)UIButton *button;
@property(readonly,nonatomic)UIImage *image;
@property(readonly,nonatomic)NSString *title;

@property(readonly,nonatomic)UIView *view;

@property(readonly,nonatomic)NSArray *images;
@property(readonly,nonatomic)NSArray *titles;

@end
