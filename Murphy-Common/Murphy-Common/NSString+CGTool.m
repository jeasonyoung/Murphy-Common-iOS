//
//  NSString+MD5Addition.m
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/2/6.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "NSString+CGTool.h"
#import <CommonCrypto/CommonDigest.h>

//实现
@implementation NSString (CGTool)

#pragma mark -- 去除空格
-(NSString *)trim{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - md5
-(NSString *)md5{
    if(self == nil || [self length] == 0) return nil;
    //
    const char *val = [self UTF8String];
    unsigned char outputBuf[CC_MD5_DIGEST_LENGTH];
    CC_MD5(val, (unsigned)strlen(val), outputBuf);
    //
    NSMutableString *outputStr = [[NSMutableString alloc] initWithCapacity:(CC_MD5_DIGEST_LENGTH * 2)];
    for(NSUInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputStr appendFormat:@"%02x", outputBuf[count]];
    }
    return outputStr;
}

@end
