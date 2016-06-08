//
//  ThreadTableViewCell.h
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYHSelectedOtherBock)();
typedef void (^LYHTouchParameterStingBlock)(NSString *);
@interface ThreadTableViewCell : UITableViewCell
@property (nonatomic, strong) NSMutableArray *teams;
@property (nonatomic, copy) LYHTouchParameterStingBlock teamsBlock;
@property (nonatomic, copy) LYHSelectedOtherBock moreTeamsBlock;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
