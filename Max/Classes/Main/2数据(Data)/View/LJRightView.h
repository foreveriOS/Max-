//
//  LJRightView.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYHSelectedOtherBock)();
@interface LJRightView : UIView
@property (nonatomic, copy) LYHSelectedOtherBock moreLeargusBlock;
+ (instancetype)rightView;
@end
