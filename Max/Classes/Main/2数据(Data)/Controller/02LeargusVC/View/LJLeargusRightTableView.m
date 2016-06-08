//
//  LJLeargusRightTableView.m
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLeargusRightTableView.h"

#import "LJLeargusHeroCell.h"
#import "LJPlayersDataModel.h"
#import "LJPlayersHeroModel.h"
#import "LJLeargusHeaderView.h"


@interface LJLeargusRightTableView () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign, getter=isHero) BOOL flag;
@end

@implementation LJLeargusRightTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {

    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
//- (void)setRightHeroDatas:(NSMutableArray *)rightHeroDatas {
//
//    _rightHeroDatas = rightHeroDatas;
//}
//- (void)setRightPlayerDatas:(NSMutableArray *)rightPlayerDatas {
//
//    _rightPlayerDatas = rightPlayerDatas;
//}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.isHero) {

        return self.rightHeroDatas.count;
    }

    return self.rightPlayerDatas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LJLeargusHeroCell *cell = [LJLeargusHeroCell cellWithTableView:tableView];
    if (self.isHero) {
        cell.rightHeroModel = self.rightHeroDatas[indexPath.row];
    } else {
        cell.rightPlayersModel = self.rightPlayerDatas[indexPath.row];
    }
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.rightPlayersDatasBlock) {
        self.rightPlayersDatasBlock();
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    LJLeargusHeaderView *headerView = [LJLeargusHeaderView headerWithView];
    return headerView;
}
@end
