//
//  NewsLargeTableViewCell.m
//  Max
//
//  Created by clip on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsLargeTableViewCell.h"

@implementation NewsLargeTableViewCell

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
    
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:_cellModel.imageUrl]];
    
//    self.titleLabel.numberOfLines = 0;
//    
//    NSDictionary *attributes = @{
//                                 NSFontAttributeName : [UIFont systemFontOfSize:14]
//                                 };
//    
//    CGRect rect = [_cellModel.title boundingRectWithSize:CGSizeMake(self.frame.size.width, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
//    
//    self.titleLabel.height = rect.size.height;
    
    self.titleLabel.text = _cellModel.title;
    
    self.clickLabel.text = [NSString stringWithFormat:@"查看:%@",_cellModel.click];
    
    self.dateLabel.text = _cellModel.date;
    
}

@end
