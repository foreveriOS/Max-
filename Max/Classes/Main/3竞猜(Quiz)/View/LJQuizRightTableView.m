//
//  LJQuizRightTableView.m
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJQuizRightTableView.h"
#import "LJQuizRightHeadView.h"

#import "LJQuizLeftCell.h"
#import "LJQuizLeftHeaderView.h"

#import "QuizModel.h"
#import "LJMatchModel.h"

@interface LJQuizRightTableView () <UITableViewDataSource, UITableViewDelegate>

@end
@implementation LJQuizRightTableView {
    BOOL _flag[100];
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {

        self.delegate = self;
        self.dataSource = self;
        [self _addRightToolBar];
    }
    return self;
}
- (void)_addRightToolBar {
    
    LJQuizRightHeadView *toolBar = [[LJQuizRightHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    toolBar.backgroundColor = [UIColor whiteColor];
    self.tableHeaderView = toolBar;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {


    return self.matchesDatas.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (!_flag[section]) {
        
        return 0;
    }
    
    NSArray *arr = self.matchesDatas[section];
    
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LJQuizLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [LJQuizLeftCell cellWithTableView:tableView];
    }
    NSArray *arr = self.matchesDatas[indexPath.section];
    cell.matchesModel = arr[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    //    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    //    [btn addTarget:self action:@selector(clickHeadView:) forControlEvents:UIControlEventTouchDown];

    LJQuizLeftHeaderView *headerView = [LJQuizLeftHeaderView headerWithTableView:tableView];
    headerView.tag = 1000+section;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [headerView addGestureRecognizer:tap];
    
    headerView.quizModels = self.rightDatas[section];
    return headerView;
}
-(void)tapAction:(UITapGestureRecognizer *)tap{
    NSInteger section = tap.view.tag - 1000;
    
    _flag[section] = !_flag[section];
    
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return kScreenWidth / 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kScreenWidth / 5;
}
/**
 *  去除系统自带的section停留效果
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self) {
        //设置组头部视图的偏移量，一般设置成与组头部视图高度相等
        //        CGFloat sectionHeaderHeight = kScreenWidth;
        CGFloat sectionHeaderHeight = kScreenWidth / 3;
        
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(- scrollView.contentOffset.y, 0, 0, 0);
        } else if(scrollView.contentOffset.y >= sectionHeaderHeight) {
            
            scrollView.contentInset = UIEdgeInsetsMake(- sectionHeaderHeight, 0, 0, 0);
        }
    }
}
@end
