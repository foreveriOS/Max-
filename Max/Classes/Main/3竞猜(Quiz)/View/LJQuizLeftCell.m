//
//  LJQuizLeftCell.m
//  Max
//
//  Created by MJ on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJQuizLeftCell.h"
#import "LJMatchModel.h"
#import "LJMatchTeamModel.h"

@interface LJQuizLeftCell ()
@property (weak, nonatomic) IBOutlet UILabel *lefteItem_gain_percentView;
@property (weak, nonatomic) IBOutlet UILabel *rightItem_gain_percentView;
@property (weak, nonatomic) IBOutlet UILabel *sub_titleView;
@property (weak, nonatomic) IBOutlet UILabel *end_bid_timeView;

@end
@implementation LJQuizLeftCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"CellID";

    LJQuizLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *arrCell = [[NSBundle mainBundle] loadNibNamed:@"LJQuizLeftCell" owner:nil options:nil];
        cell = [arrCell lastObject];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setMatchesModel:(LJMatchModel *)matchesModel {

    _matchesModel = matchesModel;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //加载数据

    [self setupDatas];
}

- (void)setupDatas {

//#warning nslog
    NSLog(@"team1_info===%@", self.matchesModel);

    NSDictionary *team1_info = self.matchesModel.team1_info;
    NSDictionary *team2_info = self.matchesModel.team2_info;

    self.sub_titleView.text = self.matchesModel.sub_title;
    self.end_bid_timeView.text = self.matchesModel.end_bid_time;
    self.lefteItem_gain_percentView.text = [NSString stringWithFormat:@"%.2lf", [team1_info[@"eitem_gain_percent"] floatValue]];
    self.rightItem_gain_percentView.text = [NSString stringWithFormat:@"%.2lf", [team2_info[@"eitem_gain_percent"] floatValue]];
}

@end
