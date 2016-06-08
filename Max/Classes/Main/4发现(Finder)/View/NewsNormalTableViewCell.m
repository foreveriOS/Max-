
//
//  NewsNormalTableViewCell.m
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsNormalTableViewCell.h"

@implementation NewsNormalTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellModel:(FindModel *)cellModel {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _cellModel = cellModel;
    
    self.titleLabel.text = _cellModel.title;
    
    [self.normalImageView sd_setImageWithURL:[NSURL URLWithString:_cellModel.imageUrl]];
    
    self.dateLabel.text = _cellModel.date;
    
    self.clickLabel.text = [NSString stringWithFormat:@"查看:%@",_cellModel.click];
    
}

@end
