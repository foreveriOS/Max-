//
//  UIImage+Extension.m
//  网易彩票
//
//  Created by mac on 16/4/3.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/**
 *  返回一张可以随意拉伸不变形的图片, 一共有三种拉伸方法
 */
+ (UIImage *)resizableImage:(NSString *)name {

    UIImage *image = [UIImage imageNamed:name];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];

    return image;
}
/*
+ (UIImage *)resizableImage:(NSString *)name {

    UIImage *image = [UIImage imageNamed:name];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;

    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW)];
}*/
    /*
+ (UIImage *)resizableImage:(NSString *)name {

    UIImage *image = [UIImage imageNamed:name];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;

    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeStretch];
}*/

@end


