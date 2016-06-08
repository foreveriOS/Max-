//
//  ThreadTableViewCell.m
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "ThreadTableViewCell.h"
#import "LJSecondScrollView.h"

@interface ThreadTableViewCell ()

@property (weak, nonatomic) IBOutlet LJSecondScrollView *scrollView;

@end
@implementation ThreadTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"ThreadCellID";

    ThreadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *arrCell = [[NSBundle mainBundle] loadNibNamed:@"ThreadCell" owner:nil options:nil];
        cell = [arrCell lastObject];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1. 创建collectionView
//        [self _addCollcetionview];
//
//        //2. 设置frame
//        [self _setupFrame];
    }
    return self;
}

- (void)awakeFromNib {

    [self _addScrollView];
}

- (void)setTeams:(NSMutableArray *)teams {

    _teams = teams;

    self.scrollView.teams = teams;
}
- (void)_addScrollView {

    self.scrollView.contentSize = CGSizeMake(kScreenWidth*2 + (kScreenWidth/2-50)/2 + 20, kScreenWidth/2-50);
    //    self.scrollView.contentInset = ;
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    self.scrollView.showsHorizontalScrollIndicator = NO; // 水平方向是否显示滑动条 ,默认是显示的
    self.scrollView.showsVerticalScrollIndicator  = NO; //竖直方向是否显示滚动条
    self.scrollView.bounces = NO; //反弹效果关闭

    self.scrollView.teamsBlock = ^(NSString *name){
        if (self.teamsBlock) {
            self.teamsBlock(name);
        }
    };
    self.scrollView.moreTeamsBlock = ^(){
        if (self.moreTeamsBlock) {
            self.moreTeamsBlock();
        }
    };

}

@end
