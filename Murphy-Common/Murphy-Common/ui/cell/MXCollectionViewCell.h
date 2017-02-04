//
//  MXCollectionViewCell.h
//  Murphy-Common
//
//  Created by jeasonyoung on 2017/1/27.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXCollectionViewCell : UICollectionViewCell{
    /**
     * @brief 图片对象变量。
     **/
    UIImageView *_imageView;
    /**
     * @brief 标题对象变量。
     **/
    UILabel *_title;
    /**
     * @brief 数据对象。
     **/
    id _datas;
}

/**
 * @brief 获取或设置图像视图。
 **/
@property(strong, nonatomic) UIImageView *imageView;

/**
 * @brief 获取或设置标题。
 **/
@property(strong, nonatomic) UILabel *title;

/**
 * @brief 获取或设置数据。
 **/
@property(strong, nonatomic)id datas;

@end
