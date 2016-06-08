//
//  FourthSectionCell.m
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "FourthSectionCell.h"
#import "PlayersView.h"

@interface FourthSectionCell ()
@property (weak, nonatomic) IBOutlet UIView *allView;
@property (weak, nonatomic) IBOutlet PlayersView *playersView;

@end
@implementation FourthSectionCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"FourthCellID";

    FourthSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *arrCell = [[NSBundle mainBundle] loadNibNamed:@"FourthSectionCell" owner:nil options:nil];
        cell = [arrCell lastObject];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];

    self.playersView.playerBlock = ^(UIButton *button){

        if ([self.delegate respondsToSelector:@selector(didclickPlayerButton:)]) {

            [self.delegate didclickPlayerButton:button];
        }
    };

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAllView:)];
    [self.allView addGestureRecognizer:tap];
}
- (void)clickAllView:(UIGestureRecognizer *)tap {

//    NSLog(@"查看更多");
    if ([self.delegate respondsToSelector:@selector(didclickAllView)]) {
        [self.delegate didclickAllView];
    }

}
/**
 *  传值到playersView
 */
- (void)setPlayers:(NSMutableArray *)players {

    _players = players;
    self.playersView.players = players;
}

@end
