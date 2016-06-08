//
//  LJCommonView.h
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayersModel;
@interface LJCommonView : UIView
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) PlayersModel *playersModel; //section4Cell
+ (instancetype)backWithView;
@end
