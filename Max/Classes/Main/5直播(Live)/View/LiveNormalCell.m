


//
//  LiveNormalCell.m
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LiveNormalCell.h"

@implementation LiveNormalCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setLiveModel:(LiveModel *)liveModel {
    
    _liveModel = liveModel;
    
    [self.liveImageView sd_setImageWithURL:[NSURL URLWithString:_liveModel.live_img]];
    
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:_liveModel.live_userimg]];
    
    self.userImageView.layer.cornerRadius = 16;
    
    self.userImageView.layer.masksToBounds = YES;
    
    
    
    self.liveOnlineLabel.text = [NSString stringWithFormat:@"%@ 名观众",_liveModel.live_online];
    
    self.userNameLabel.text = _liveModel.live_nickname;
    
}

@end
