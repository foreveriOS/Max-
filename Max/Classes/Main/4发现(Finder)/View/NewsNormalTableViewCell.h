//
//  NewsNormalTableViewCell.h
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindModel.h"

@interface NewsNormalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *normalImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;



@property (strong, nonatomic) FindModel *cellModel;
@end


