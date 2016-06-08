//
//  LJTeamsView.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJTeamsView.h"
#import "UIImageView+WebCache.h"
#import "TeamsModel.h"

@interface LJTeamsView ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *rankingView; //排名
@property (weak, nonatomic) IBOutlet UILabel *oddsView; //胜率
@property (weak, nonatomic) IBOutlet UILabel *mmrView;

@end
@implementation LJTeamsView
+ (instancetype)teamsWithView {

    return [[[NSBundle mainBundle] loadNibNamed:@"LJTeamsView" owner:nil options:nil] lastObject];
}

- (void)setTeamsModel:(TeamsModel *)teamsModel {

    _teamsModel = teamsModel;


    //1. 填充数据
    [self.backgroundView sd_setImageWithURL:[NSURL URLWithString:self.teamsModel.bg] placeholderImage:[UIImage imageNamed:@"sns_icon_23"]];
//    self.backgroundView.layer.cornerRadius = 12;
//    self.backgroundView.layer.masksToBounds = YES;

    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.teamsModel.image_url] placeholderImage:[UIImage imageNamed:@"sns_icon_23"]];
//    self.iconView.layer.cornerRadius = 12;
//    self.iconView.layer.masksToBounds = YES;

    self.titleView.text = self.teamsModel.team_name;
    self.rankingView.text = [NSString stringWithFormat:@"%li", [self.teamsModel.rank integerValue]];
    self.oddsView.text = [NSString stringWithFormat:@"%.1lf", [self.teamsModel.win_rate floatValue]];
    self.mmrView.text = [NSString stringWithFormat:@"%li", [self.teamsModel.mmr integerValue]];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (self.teamsBlock) {
        self.teamsBlock(self.titleView.text);
    }
}

@end
