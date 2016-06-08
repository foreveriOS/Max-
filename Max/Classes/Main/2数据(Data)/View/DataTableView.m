//
//  DataTableView.m
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "DataTableView.h"

#import "FirstSectionCell.h"
#import "SecondOrThirdSectionCell.h"
#import "ThreadTableViewCell.h"
#import "FourthSectionCell.h"


@interface DataTableView () <UITableViewDelegate, UITableViewDataSource, LJDidSelectedButtonDelegate, LJDidSelectedAllViewDelegate>
@property (nonatomic, strong) NSArray *titles;
@end
@implementation DataTableView
- (NSArray *)titles {

    if (!_titles) {
        _titles = @[@"游戏资料", @"职业联赛", @"热门战队/玩家"];
    }
    return _titles;
}
- (void)setLeagues:(NSMutableArray *)leagues {

    _leagues = leagues;
    
}
- (void)setTeams:(NSMutableArray *)teams {

    _teams = teams;
}
- (void)setPlayers:(NSMutableArray *)players {

    _players = players;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {

    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
#pragma mark - LJDidSelectedButton
- (void)didclickButton:(UIButton *)button {
    if ([self.delegate2 respondsToSelector:@selector(didclickBtn:)]) {
        [self.delegate2 didclickBtn:button];
    }
}
#pragma mark - LJDidSelectedAllViewDelegate
- (void)didclickAllView {

    if (self.morePlayersBlock) {
        self.morePlayersBlock();
    }
}
- (void)didclickPlayerButton:(UIButton *)button {

    if (self.playersBlock) {
        self.playersBlock(button);
    }
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return 2;
    }
    return 1;
}
//- (void) {
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
         FirstSectionCell *cell = [FirstSectionCell cellWithTableView:tableView];
         cell.delegate = self; //代理
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;

    } else if (indexPath.section == 1) {
            SecondOrThirdSectionCell *cell = [SecondOrThirdSectionCell cellWithTableView:tableView];
        cell.leagues = self.leagues;

        cell.leargusBlock = ^(NSString *name){
            self.leargusBlock(name);
        };
        cell.moreLeargusBlock = ^(){
            if (self.moreLeargusBlock) {
                self.moreLeargusBlock();
            }
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

    } else {
        
        if (indexPath.row == 0) {
            
            ThreadTableViewCell *cell = [ThreadTableViewCell cellWithTableView:tableView];
            cell.teams = self.teams;
            
            cell.teamsBlock = ^(NSString *name){
                if (self.teamsBlock) {
                    self.teamsBlock(name);
                }
            };
            cell.moreTeamsBlock = ^(){
                if (self.moreTeamsBlock) {
                    self.moreTeamsBlock();
                }
            };
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
            
        } else {
            FourthSectionCell *cell = [FourthSectionCell cellWithTableView:tableView];
            cell.delegate = self; //代理
            cell.players = self.players;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }


    }
}



#pragma mark - UITableViewDelegate
/**
 *  返回cell行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        return (kScreenWidth - 40) / 4;

    } else if (indexPath.section == 2) {
        
        if (indexPath.row == 1) {
            
            return kScreenWidth * 0.35;
        } else {
            return (kScreenWidth - 50) / 2 * 0.9;
        }

    }else {
        
        return (kScreenWidth - 50) / 2;
    }
}
    


/**
 *  返回section显示的标题
 */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//    if (section == 3) return nil;
//    
////    NSString *title = self.titles[section];
////    [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:<#(nullable NSDictionary<NSString *,id> *)#> context:<#(nullable NSStringDrawingContext *)#>];
//    
//        return self.titles[section];
//
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        return nil;
    }
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"\t    %@", self.titles[section]];
    label.font = [UIFont systemFontOfSize:12];
    return label;
}

/**
 *  去除系统自带的section停留效果
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView == self) {
        //设置组头部视图的偏移量，一般设置成与组头部视图高度相等
//        CGFloat sectionHeaderHeight = kScreenWidth;
        CGFloat sectionHeaderHeight = 30;

        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(- scrollView.contentOffset.y, 0, 0, 0);
        } else if(scrollView.contentOffset.y >= sectionHeaderHeight) {

            scrollView.contentInset = UIEdgeInsetsMake(- sectionHeaderHeight, 0, 0, 0);
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 35;
}

@end
