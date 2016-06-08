//
//  LJQuizLeftCell.h
//  Max
//
//  Created by MJ on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJMatchModel;
@interface LJQuizLeftCell : UITableViewCell
@property (nonatomic, strong) LJMatchModel *matchesModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
