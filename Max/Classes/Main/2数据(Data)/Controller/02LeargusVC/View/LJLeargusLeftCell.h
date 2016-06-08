//
//  LJLeargusLeftCell.h
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJPlayersModel;
@interface LJLeargusLeftCell : UITableViewCell
@property (nonatomic, strong) LJPlayersModel *leftModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
