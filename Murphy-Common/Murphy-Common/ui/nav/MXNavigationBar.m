//
//  BaseNavigationBar.m
//  common
//
//  Created by jeasonyoung on 2017/1/22.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MXNavigationBar.h"

#ifndef IS_IOS7
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
#endif

#define Height 55.0

@implementation MXNavigationBar


-(void)setColorAdjustFactor:(UIColor *)colorAdjustFactor{
    _colorAdjustFactor = colorAdjustFactor;
    if(IS_IOS7){
        self.barTintColor = colorAdjustFactor;
    }else{
        self.tintColor = colorAdjustFactor;
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
