//
//  LJLeargusHeroCell.m
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLeargusHeroCell.h"

#import "LJPlayersDataModel.h"
#import "LJPlayersHeroModel.h"
#import "UIImageView+WebCache.h"

@interface LJLeargusHeroCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameView;
@property (nonatomic, strong) UIImageView *vipView;
@property (nonatomic, strong) UILabel *match_countView;
@property (nonatomic, strong) UILabel *ban_countView;
@property (nonatomic, strong) UILabel *kdaView;
@property (nonatomic, strong) UILabel *win_rateView;
@end
@implementation LJLeargusHeroCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"LJLeargusHeroCell";

    LJLeargusHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[LJLeargusHeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1. 添加UI控件
        [self _addUI];

        //2. 设置frame
        [self _setupFrame];
    }
    return self;
}
- (void)_addUI {
#warning --------backgroundColor
    //1.图标
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconView];
    self.iconView = iconView;

    //2.标题名
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:nameView];
    self.nameView = nameView;

    //3.是否是vip
    UIImageView *vipView = [[UIImageView alloc] init];
    vipView.contentMode = UIViewContentModeScaleAspectFit;
    vipView.hidden = YES;
    [self.contentView addSubview:vipView];
    self.vipView = vipView;

    //4.匹配数
    UILabel *match_countView = [[UILabel alloc] init];
    match_countView.font = [UIFont systemFontOfSize:15];
    match_countView.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:match_countView];
    self.match_countView = match_countView;

    //5.禁止数
    UILabel *ban_countView = [[UILabel alloc] init];
    ban_countView.font = [UIFont systemFontOfSize:15];
    ban_countView.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:ban_countView];
    self.ban_countView = ban_countView;

    //6.kda
    UILabel *kdaView = [[UILabel alloc] init];
    kdaView.font = [UIFont systemFontOfSize:15];
    kdaView.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:kdaView];
    self.kdaView = kdaView;

    //7.胜率
    UILabel *win_rateView = [[UILabel alloc] init];
    win_rateView.font = [UIFont systemFontOfSize:15];
    win_rateView.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:win_rateView];
    self.win_rateView = win_rateView;

}
- (void)_setupFrame {

    CGFloat margin = 5;
    CGFloat cellW = kScreenWidth;
    CGFloat cellH = 70;
    CGFloat width = (cellW - margin * 7) / 7;
//    CGFloat height = cellH - 2*margin;
    CGFloat height = width;

    //1.iconView
    CGFloat iconViewX = margin*2;
    self.iconView.frame = CGRectMake(iconViewX, margin, width, height);
    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.cornerRadius = width*0.5;

    //2.nameView
    CGFloat nameViewX = CGRectGetMaxX(self.iconView.frame) + margin;
    self.nameView.frame = CGRectMake(nameViewX+margin, margin, width, height);

    //3.vipView
    CGFloat vipViewX = CGRectGetMaxX(self.nameView.frame);
    self.vipView.frame = CGRectMake(vipViewX, margin, width*0.5, height);

    //4.match_countView
    CGFloat match_countViewX = CGRectGetMaxX(self.vipView.frame) + margin;
    self.match_countView.frame = CGRectMake(match_countViewX, margin, width, height);

    //5.ban_countView
    CGFloat ban_countViewX = CGRectGetMaxX(self.match_countView.frame) + margin;
    self.ban_countView.frame = CGRectMake(ban_countViewX, margin, width, height);

    //6.kdaView
    CGFloat kdaViewX = CGRectGetMaxX(self.ban_countView.frame) + margin;
    self.kdaView.frame = CGRectMake(kdaViewX, margin, width, height);

    //7.win_rateView
    CGFloat win_rateViewX = CGRectGetMaxX(self.kdaView.frame) + margin;
    self.win_rateView.frame = CGRectMake(win_rateViewX, margin, width, height);
}

- (void)setRightHeroModel:(LJPlayersHeroModel *)rightHeroModel {

    _rightHeroModel = rightHeroModel;

    //设置hero数据
    [self _setupHeroDatas];
}
- (void)_setupHeroDatas {

    //设置hero数据
    //1.iconView
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.rightHeroModel.img_name] placeholderImage:[UIImage imageNamed:@"CheckBoxSelectedSkin"]];

    //2.nameView
    self.nameView.text = self.rightHeroModel.hero_name;

    //3.vipView
    self.vipView.image = [UIImage imageNamed:@"CheckBoxSelectedSkin"];

    //4.match_countView
    self.match_countView.text = [NSString stringWithFormat:@"%li", [self.rightHeroModel.match_count integerValue]];

    //5.ban_countView
    self.ban_countView.text = [NSString stringWithFormat:@"%li", [self.rightHeroModel.ban_count integerValue]];

    //6.kdaView
    self.kdaView.text = self.rightHeroModel.kda;

    //7.win_rateView
    self.win_rateView.text = [NSString stringWithFormat:@"%.1f%@", [self.rightHeroModel.win_rate floatValue], @"%"];
}
- (void)setRightPlayersModel:(LJPlayersDataModel *)rightPlayersModel {

    _rightPlayersModel = rightPlayersModel;

    //设置players（选手）数据
    [self _setupPlayersData];
}

- (void)_setupPlayersData {
    //设置players数据
    //1.iconView
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.rightPlayersModel.image_url] placeholderImage:[UIImage imageNamed:@"CheckBoxSelectedSkin"]];

    //2.nameView
    self.nameView.text = self.rightPlayersModel.personaname;

    //3.vipView
    if ([self.rightPlayersModel.is_verified boolValue]) {
        self.vipView.hidden = NO;
        self.vipView.image = [UIImage imageNamed:@"CheckBoxSelectedSkin"];
    }


    //4.match_countView
    self.match_countView.text = [NSString stringWithFormat:@"%li", [self.rightPlayersModel.k integerValue]];

    //5.ban_countView
    self.ban_countView.text = [NSString stringWithFormat:@"%li", [self.rightPlayersModel.d integerValue]];

    //6.kdaView
    self.kdaView.text = [NSString stringWithFormat:@"%li", [self.rightPlayersModel.a integerValue]];

    //7.win_rateView
    self.win_rateView.text = self.rightPlayersModel.kda;
}

@end
