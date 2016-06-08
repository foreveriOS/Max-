//
//  LJLeargusLeftCell.m
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLeargusLeftCell.h"
#import "LJPlayersModel.h"
#import "UIImageView+WebCache.h"

@interface LJLeargusLeftCell ()
@property (weak, nonatomic) IBOutlet UILabel *team_1View;
@property (weak, nonatomic) IBOutlet UIImageView *team_1iconView;
@property (weak, nonatomic) IBOutlet UIImageView *team_1winImage;
@property (weak, nonatomic) IBOutlet UILabel *start_timeView;
@property (weak, nonatomic) IBOutlet UILabel *team_2View;
@property (weak, nonatomic) IBOutlet UIImageView *team_2iconView;
@property (weak, nonatomic) IBOutlet UIImageView *team_2winImage;

@end
@implementation LJLeargusLeftCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"LJLeargusLeftCell";

    LJLeargusLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *arrCell = [[NSBundle mainBundle] loadNibNamed:@"LJLeargusLeftCell" owner:nil options:nil];
        cell = [arrCell lastObject];
    }
    return cell;
}


- (void)setLeftModel:(LJPlayersModel *)leftModel {

    _leftModel = leftModel;

    self.team_1View.text = self.leftModel.team1_name;
    [self.team_1iconView sd_setImageWithURL:[NSURL URLWithString:self.leftModel.team1_image_url] placeholderImage:[UIImage imageNamed:@""]];
    self.team_2View.text = self.leftModel.team2_name;
    [self.team_2iconView sd_setImageWithURL:[NSURL URLWithString:self.leftModel.team2_image_url] placeholderImage:[UIImage imageNamed:@""]];
    self.start_timeView.text = [NSString stringWithFormat:@"%li", [self.leftModel.start_time integerValue]];
    if (self.leftModel.radiant_win) {
        self.team_1winImage.image = [UIImage imageNamed:@"CheckBoxSelectedSkin"];
    } else {
        self.team_2winImage.image = [UIImage imageNamed:@"CheckBoxSelectedSkin"];
    }
}
@end
