//
//  LJCommonView.m
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJCommonView.h"

#import "PlayersModel.h"
#import "UIImageView+WebCache.h"

@interface LJCommonView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

@end
@implementation LJCommonView

+ (instancetype)backWithView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"LJCommonView" owner:nil options:nil] lastObject];
}

- (void)setPlayersModel:(PlayersModel *)playersModel {
    
    _playersModel = playersModel;
    
    self.titleView.text = self.playersModel.name;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.playersModel.image_url] placeholderImage:[UIImage imageNamed:@"icon_find_selected"]];
    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.cornerRadius = 15;

}

@end
