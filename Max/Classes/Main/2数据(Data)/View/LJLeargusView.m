//
//  LJLeargusView.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLeargusView.h"
#import "UIImageView+WebCache.h"
#import "LeaguesModel.h"

@interface LJLeargusView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;
@property (weak, nonatomic) IBOutlet UILabel *numberView;

@end
@implementation LJLeargusView

- (void)awakeFromNib {

    //1. 填充数据

    //2. 
}
- (void)setLeaguesModel:(LeaguesModel *)leaguesModel {

    _leaguesModel = leaguesModel;

    //1. 填充数据
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.leaguesModel.image_url] placeholderImage:[UIImage imageNamed:@"sns_icon_23"]];
//    self.iconView.layer.cornerRadius = 20;
//    self.iconView.layer.masksToBounds = YES;

    self.titleView.text = self.leaguesModel.name;
    self.numberView.text = [NSString stringWithFormat:@"第%li场", [self.leaguesModel.match_count integerValue]];
    self.timeView.text = [NSString stringWithFormat:@"最近比赛%li前", [self.leaguesModel.last_match_time integerValue]];
    //2.
}
+ (instancetype)leargusWithView {

    return [[[NSBundle mainBundle] loadNibNamed:@"LJLeargusView" owner:nil options:nil] lastObject];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSString *name = self.titleView.text;
    if (self.leargusBlock) {
        self.leargusBlock(name);
    }
}
@end
