//
//  FourthSectionCell.h
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LJDidSelectedAllViewDelegate <NSObject>
@required
- (void)didclickAllView;
- (void)didclickPlayerButton:(UIButton *)button;
@end

@interface FourthSectionCell : UITableViewCell
@property (nonatomic, strong) id<LJDidSelectedAllViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *players;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
