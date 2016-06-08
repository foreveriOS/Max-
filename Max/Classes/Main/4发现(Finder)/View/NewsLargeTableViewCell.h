//
//  NewsLargeTableViewCell.h
//  Max
//
//  Created by clip on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindModel.h"

@interface NewsLargeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@property (strong, nonatomic) FindModel *cellModel;

@end
