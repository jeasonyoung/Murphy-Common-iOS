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

#import "MXViewController.h"
#import "MXNavigationBar.h"
#import "MXNavigationController.h"

#import "MXCollectionViewCell.h"

#import "UINavigationItem+BaseNavigationItem.h"


@interface Murphy_Common : NSObject

@end
