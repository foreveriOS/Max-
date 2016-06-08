//
//  LJLeargusHeroCell.h
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJPlayersDataModel;
@class LJPlayersHeroModel;
@interface LJLeargusHeroCell : UITableViewCell
@property (nonatomic, strong) LJPlayersDataModel *rightPlayersModel;
@property (nonatomic, strong) LJPlayersHeroModel *rightHeroModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
