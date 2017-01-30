//
//  BaseNavBarButtonItem.m
//  common
//
//  Created by jeasonyoung on 2017/1/23.
//  Copyright © 2017年 ipower. All rights reserved.
//

#import "MXNavBarButtonItem.h"

typedef enum {
    NavBarButtonItemTypeDefault = 0,
    NavBarButtonItemTypeBack,
    NavBarButtonItemTypeRight
} NavBarButtonItemType;

@implementation MXNavBarButtonItem

-(instancetype)initWithType:(NavBarButtonItemType)itemType image:(NSString *)image title:(NSString *)title{
    if(self = [super init]){
        _title = title;
        UIImage *obj;
        _button = [self createButtonWithImage:image andTitle:title outImageObj:&obj];
        if(obj) _image = obj;
    }
    return self;
}

-(instancetype)initWithType:(NavBarButtonItemType)itemType images:(NSArray *)images titles:(NSArray *)titles{
    if(self = [super init]){
        _images = images;
        _titles = titles;
        if(images && images.count){
            UIView *view = [UIView new];
            UIImage *obj;
            for(int i = 0; i < images.count; i++){
                UIButton *btn = [self createButtonWithImage:images[i] andTitle:titles[i] outImageObj:&obj];
                view.frame = btn.frame;
                [view addSubview:btn];
            }
            [_view addSubview:view];
        }
    }
    return self;
}

-(UIButton *)createButtonWithImage:(NSString *)image andTitle:(NSString *)title outImageObj:(UIImage **)imgObj{
    UIImage *img   = image ? [UIImage imageNamed:image] : nil;
    CGSize imgSize = img ? img.size : CGSizeZero;
    if(img){
        *imgObj = img;
    }
    
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize titleSize = [self createTitle:title font:font maxSize:CGSizeMake(100, font.lineHeight)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, imgSize.width + titleSize.width, MAX(imgSize.height, titleSize.height));
    btn.titleLabel.font = font;
    
    return btn;
}

-(CGSize)createTitle:(NSString *)title font:(UIFont *)font maxSize:(CGSize)maxSize{
    if(title && title.length){
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName : font}];
        CGRect rect = [attributedText boundingRectWithSize:maxSize
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        return rect.size;
    }
    return CGSizeZero;
}

-(void)setTarget:(id)target withAction:(SEL)action{
    if(self.button){
        [_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [_button setImage:self.image forState:UIControlStateNormal];
    }
    if(self.title){
        [_button setTitle:self.title forState:UIControlStateNormal];
    }
}

+(instancetype)itemWithTarget:(id)target title:(NSString *)title action:(SEL)action image:(NSString *)image{
    MXNavBarButtonItem *btnItem = [[MXNavBarButtonItem alloc] initWithType:NavBarButtonItemTypeBack image:image title:title];
    [btnItem setTarget:target withAction:action];
    return btnItem;
}

+(instancetype)itemWithTarget:(id)target titles:(NSArray *)titles actions:(NSArray *)actions images:(NSArray *)images{
    return [[MXNavBarButtonItem alloc] initWithType:NavBarButtonItemTypeBack images:images titles:titles];
}

@end
