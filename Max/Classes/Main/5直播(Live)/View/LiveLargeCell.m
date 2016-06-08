//
//  LiveLargeCell.m
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LiveLargeCell.h"

@implementation LiveLargeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setLiveModel:(LiveModel *)liveModel {
    
    _liveModel = liveModel;
    
    self.titleLabel.text = _liveModel.live_title;
    
    self.userNameLabel.text = _liveModel.live_nickname;
    
    self.liveOnlineLabel.text = [NSString stringWithFormat:@"%@ 名观众",_liveModel.live_online];
    
    [self.liveImageView sd_setImageWithURL:[NSURL URLWithString:_liveModel.live_img]];
    
    self.userImageView.layer.cornerRadius = 17.5;
    
    self.userImageView.layer.masksToBounds = YES;
    
    self.userImageView.userInteractionEnabled = YES;
    
    self.liveImageView.userInteractionEnabled = YES;
    
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:_liveModel.live_userimg]];
    
}

@end
