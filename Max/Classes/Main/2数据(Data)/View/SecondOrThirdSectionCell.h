//
//  SecondOrThirdSectionCell.h
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYHSelectedOtherBock)();
typedef void (^LYHTouchParameterStingBlock)(NSString *);
@interface SecondOrThirdSectionCell : UITableViewCell
@property (nonatomic, strong) NSMutableArray *leagues;
@property (nonatomic, copy) LYHSelectedOtherBock moreLeargusBlock;
@property (nonatomic, copy) LYHTouchParameterStingBlock leargusBlock;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
