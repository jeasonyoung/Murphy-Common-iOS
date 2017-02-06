//
//  Murphy_Common.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/1/24.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * @brief 网络状态。
 **/
typedef NS_ENUM(NSInteger, MXNetworkStatus){
    MXNetworkStatusUnknown          = -1,//未知
    MXNetworkStatusNotReachable     = 0,//无连接
    MXNetworkStatusReachableViaWWAN = 1,//3G/4G
    MXNetworkStatusReachableViaWiFi = 2,//WIFI
};


#import "MXHeader.h"

//category
#import "NSObject+CGTool.h"
#import "NSString+MD5Addition.h"
#import "CALayer+CGLayer.h"
#import "UIView+CGTool.h"
#import "UIView+CGQuartz.h"

//ui-text
#import "MXTextField.h"
#import "MXTextView.h"
//ui-input
#import "MXInputView.h"
//ui-nav
#import "MXNavBarButtonItem.h"
#import "MXNavigationBar.h"
//ui-cell
#import "MXCollectionViewCell.h"
//ui-controllers
#import "MXViewController.h"
#import "MXNavigationController.h"

@interface Murphy_Common : NSObject

@end
