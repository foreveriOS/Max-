//
//  FirstSectionCell.h
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LJDidSelectedButtonDelegate <NSObject>
@required
- (void)didclickButton:(UIButton *)button;

@end
@interface FirstSectionCell : UITableViewCell
@property (nonatomic, strong) id<LJDidSelectedButtonDelegate> delegate;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
