//
//  NetworkStatus.h
//  common
//
//  Created by jeasonyoung on 2017/1/23.
//  Copyright © 2017年 ipower. All rights reserved.
//

#ifndef NetworkStatus_h
#define NetworkStatus_h

#import <Foundation/Foundation.h>

/**
 * @brief 网络状态。
 **/
typedef NS_ENUM(NSInteger,MXNetworkStatus){
    MXNetworkStatusUnknown          = -1,//未知
    MXNetworkStatusNotReachable     = 0,//无连接
    MXNetworkStatusReachableViaWWAN = 1,//3G/4G
    MXNetworkStatusReachableViaWiFi = 2,//WIFI
};

#endif /* NetworkStatus_h */
