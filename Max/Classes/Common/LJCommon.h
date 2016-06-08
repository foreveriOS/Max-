//
//  LJCommon.h
//  Max+
//
//  Created by MJ on 16/5/25.
//  Copyright © 2016年 LJ. All rights reserved.
//

#ifndef LJCommon_h
#define LJCommon_h


#import "UIImage+Extension.h"



#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "UIView+ViewController.h"
#import "MBProgressHUD.h"


//判断是否为ios7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


/**
 *  1. 屏幕的宽、高
 */
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

// 2.获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.自定义Log
#ifdef DEBUG
#define IWLog(...) NSLog(__VA_ARGS__)
#else
#define IWLog(...)
#endif


// 4.获得RGB颜色---班长宏定义
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(33, 192, 174)
#define separaterColor RGB(200, 199, 204)

#endif /* LJCommon_h */
