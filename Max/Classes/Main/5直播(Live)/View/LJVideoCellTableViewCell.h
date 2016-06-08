//
//  LJVideoCellTableViewCell.h
//  Max
//
//  Created by MJ on 16/6/5.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LiveModel;
@interface LJVideoCellTableViewCell : UITableViewCell
@property (nonatomic, strong) LiveModel *liveModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
