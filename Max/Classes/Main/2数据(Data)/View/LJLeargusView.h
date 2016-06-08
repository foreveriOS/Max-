//
//  LJLeargusView.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeaguesModel;

//typedef void (^LYHSelectedOtherBock)();
typedef void (^LYHTouchParameterStingBlock)(NSString *);
@interface LJLeargusView : UIView
@property (nonatomic, strong) LeaguesModel *leaguesModel;
@property (nonatomic, copy) LYHTouchParameterStingBlock leargusBlock;
//@property (nonatomic, copy) LYHSelectedOtherBock moreLeargusBlock;

+ (instancetype)leargusWithView;
@end
