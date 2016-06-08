//
//  LJMoreLeargusCell.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJMoreLeargusCell.h"
#import "MoreLeargusModel.h"
#import "UIImageView+WebCache.h"

@interface LJMoreLeargusCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;
@property (weak, nonatomic) IBOutlet UILabel *matchCountView;

@end
@implementation LJMoreLeargusCell

- (void)awakeFromNib {

    self.layer.cornerRadius = 8;
}
- (void)setMoreLeargusModel:(MoreLeargusModel *)moreLeargusModel {

    _moreLeargusModel = moreLeargusModel;

    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.moreLeargusModel.image_url] placeholderImage:[UIImage imageNamed:@"icon_face_selected"]];

    self.titleView.text = self.moreLeargusModel.name;
    self.timeView.text = [NSString stringWithFormat:@"最近比赛%li天前", [self.moreLeargusModel.last_match_time integerValue]];
    self.matchCountView.text = [NSString stringWithFormat:@"%li场", [self.moreLeargusModel.match_count integerValue]];

}
@end
