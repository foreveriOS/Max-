//
//  LJTeamsRightView.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYHSelectedOtherBock)();
@interface LJTeamsRightView : UIView
@property (nonatomic, copy) LYHSelectedOtherBock moreTeamsBlock;
+ (instancetype)rightView;
@end
