//
//  DataTableView.h
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LJDidClickdButtonDelegate <NSObject>
@required
- (void)didclickBtn:(UIButton *)button;
@end

typedef void (^LYHSelectedOtherBock)();
typedef void (^LYHSelectedParameterClassBlock)(UIButton *);
typedef void (^LYHTouchParameterStingBlock)(NSString *);

@interface DataTableView : UITableView
@property (nonatomic, strong) id<LJDidClickdButtonDelegate> delegate2;

@property (nonatomic, copy) LYHSelectedOtherBock moreLeargusBlock;//更多联盟
@property (nonatomic, copy) LYHSelectedOtherBock moreTeamsBlock; //更多战队

@property (nonatomic, copy) LYHTouchParameterStingBlock leargusBlock; //联盟
@property (nonatomic, copy) LYHTouchParameterStingBlock teamsBlock; //战队

@property (nonatomic, copy) LYHSelectedParameterClassBlock playersBlock; //玩家
@property (nonatomic, copy) LYHSelectedOtherBock morePlayersBlock; //更多玩家

//@property (nonatomic, copy) LYHSelectedParameterClassBlock gameDataBlock; //代理

@property (nonatomic, strong) NSMutableArray *leagues;
@property (nonatomic, strong) NSMutableArray *teams;
@property (nonatomic, strong) NSMutableArray *players;


@end
