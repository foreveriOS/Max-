//
//  LJQuizLeftHeaderView.m
//  Max
//
//  Created by MJ on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJQuizLeftHeaderView.h"
#import "QuizModel.h"
#import "UIImageView+WebCache.h"

@interface LJQuizLeftHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *leftIconView;
@property (weak, nonatomic) IBOutlet UILabel *leftTitleView;
@property (weak, nonatomic) IBOutlet UIImageView *rightIconView;
@property (weak, nonatomic) IBOutlet UILabel *rightTitleView;
@property (weak, nonatomic) IBOutlet UILabel *topView;
@property (weak, nonatomic) IBOutlet UILabel *centerView;
@property (weak, nonatomic) IBOutlet UILabel *bottomView;

@end
@implementation LJQuizLeftHeaderView
+ (instancetype)headerWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"CellID";

    LJQuizLeftHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    if (headerView == nil) {
        NSArray *arrCell = [[NSBundle mainBundle] loadNibNamed:@"LJQuizLeftHeaderView" owner:nil options:nil];
        headerView = [arrCell lastObject];
        
        
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

- (void)setQuizModels:(QuizModel *)quizModels {

    _quizModels = quizModels;

    //数据
    [self.leftIconView sd_setImageWithURL:[self.quizModels.team1_info[@"logo"] objectForKey:@"url"]  placeholderImage:[UIImage imageNamed:@"error"]];
    [self.rightIconView sd_setImageWithURL:[self.quizModels.team2_info[@"logo"] objectForKey:@"url"] placeholderImage:[UIImage imageNamed:@"error"]];
    self.leftTitleView.text = self.quizModels.team1_info[@"tag"];
    self.rightTitleView.text = self.quizModels.team2_info[@"tag"];
    
    self.topView.text = self.quizModels.progress_desc;
    self.centerView.text = [NSString stringWithFormat:@"%.1lf", [self.quizModels.end_bid_time floatValue] / 3600];
    self.bottomView.text = self.quizModels.title;
}




@end
