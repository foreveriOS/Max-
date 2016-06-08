//
//  LJBindingTopCell.h
//  Max
//
//  Created by MJ on 16/6/4.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJBindingTopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

+ (instancetype)bindingWithCell;
@end
