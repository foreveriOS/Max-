//
//  LJTeamsView.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TeamsModel;

typedef void (^LYHTouchParameterStingBlock)(NSString *);
@interface LJTeamsView : UIView
@property (nonatomic, strong) TeamsModel *teamsModel;
@property (nonatomic, copy) LYHTouchParameterStingBlock teamsBlock;

+ (instancetype)teamsWithView;

@end
