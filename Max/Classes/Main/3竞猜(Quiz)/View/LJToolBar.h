//
//  LJToolBar.h
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJToolBar : UIView
- (instancetype)initWithFrame:(CGRect)frame
               btn_firstTitle:(NSString *)btn_firstTitle btn_firstImage:(NSString *)btn_firstImage
              btn_secondTitle:(NSString *)btn_secondTitle btn_secondImage:(NSString *)btn_secondImage
               btn_thirdTitle:(NSString *)btn_thirdTitle btn_thirdImage:(NSString *)btn_thirdImage;
@end
