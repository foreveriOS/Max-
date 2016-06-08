//
//  LJVideoCellTableViewCell.m
//  Max
//
//  Created by MJ on 16/6/5.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJVideoCellTableViewCell.h"
#import "LiveModel.h"
#import "UIImageView+WebCache.h"

@interface LJVideoCellTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *detailView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;

@end
@implementation LJVideoCellTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"LJVideoCellTableViewCell";

    LJVideoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *arrCell = [[NSBundle mainBundle] loadNibNamed:@"LJVideoCellTableViewCell" owner:nil options:nil];
        cell = [arrCell lastObject];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLiveModel:(LiveModel *)liveModel {

    _liveModel = liveModel;

    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.cornerRadius = self.contentView.frame.size.height * 0.37;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.liveModel.live_userimg] placeholderImage:[UIImage imageNamed:@"icon_face_selected"]];
    self.detailView.text = [NSString stringWithFormat:@"%@名观众", self.liveModel.live_online];
    self.titleView.text = self.liveModel.live_nickname;
    self.timeView.text = self.liveModel.live_id;
}

@end
