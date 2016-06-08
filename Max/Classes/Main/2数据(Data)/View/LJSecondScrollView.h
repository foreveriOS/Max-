//
//  LJSecondScrollView.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYHSelectedOtherBock)();
typedef void (^LYHTouchParameterStingBlock)(NSString *);

@interface LJSecondScrollView : UIScrollView
@property (nonatomic, strong) NSMutableArray *leagues;
@property (nonatomic, strong) NSMutableArray *teams;
@property (nonatomic, copy) LYHTouchParameterStingBlock leargusBlock;
@property (nonatomic, copy) LYHTouchParameterStingBlock teamsBlock;
@property (nonatomic, copy) LYHSelectedOtherBock moreLeargusBlock;
@property (nonatomic, copy) LYHSelectedOtherBock moreTeamsBlock;

@end
