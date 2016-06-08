//
//  LJCacheCell.h
//  Max
//
//  Created by MJ on 16/6/4.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJCacheCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *clearCacheView;
@property (weak, nonatomic) IBOutlet UILabel *cacheView;
+ (instancetype)cacheWithCell;
@end
