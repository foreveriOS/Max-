//
//  LJVideoCollectionCell.m
//  Max
//
//  Created by MJ on 16/6/5.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJVideoCollectionCell.h"
#import "LiveModel.h"
#import "UIImageView+WebCache.h"

@interface LJVideoCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;
@property (weak, nonatomic) IBOutlet UIImageView *userView;
@property (weak, nonatomic) IBOutlet UILabel *userDetialView;

@property (weak, nonatomic) IBOutlet UILabel *userNameView;
@end
@implementation LJVideoCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}
- (void)setLiveModel:(LiveModel *)liveModel {

    _liveModel = liveModel;

    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.liveModel.live_img] placeholderImage:[UIImage imageNamed:@"icon_face_selected"]];
    [self.userView sd_setImageWithURL:[NSURL URLWithString:self.liveModel.live_userimg] placeholderImage:[UIImage imageNamed:@"icon_face_selected"]];
    self.userView.layer.masksToBounds = YES;
    self.userView.layer.cornerRadius = 23;

    self.titleView.text = self.liveModel.live_title;
    self.timeView.text = self.liveModel.live_name;
    self.userNameView.text = self.liveModel.live_nickname;
    self.userDetialView.text = [NSString stringWithFormat:@"%@名观众", self.liveModel.live_online];


}
@end
