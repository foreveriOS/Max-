//
//  LJLeargusLeftTableView.m
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLeargusLeftTableView.h"
#import "LJLeargusLeftCell.h"
#import "LJLeargusHeaderView.h"

@interface LJLeargusLeftTableView () <UITableViewDataSource, UITableViewDelegate>

@end
@implementation LJLeargusLeftTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {

    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return self;
}
- (void)setLeafDatas:(NSMutableArray *)leafDatas {

    _leafDatas = leafDatas;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.leafDatas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJLeargusLeftCell *cell = [LJLeargusLeftCell cellWithTableView:tableView];
    cell.leftModel = self.leafDatas[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
/**
 *  返回cell行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 55;
}
/**
 *  返回section显示的标题
 */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

//}
/**
 *  去除系统自带的section停留效果
 */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//    if (scrollView == self) {
//        //设置组头部视图的偏移量，一般设置成与组头部视图高度相等
//        CGFloat sectionHeaderHeight = kScreenWidth;
//
//        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
//            scrollView.contentInset = UIEdgeInsetsMake(- scrollView.contentOffset.y, 0, 0, 0);
//        } else if(scrollView.contentOffset.y >= sectionHeaderHeight) {
//
//            scrollView.contentInset = UIEdgeInsetsMake(- sectionHeaderHeight, 0, 0, 0);
//        }
//    }
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.rightHeroBlock) {
        self.rightHeroBlock();
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

        LJLeargusHeaderView *headerView = [LJLeargusHeaderView headerWithView];
        return headerView;
}
//- (UIView *)tableHeaderView {
//
//    LJLeargusHeaderView *headerView = [LJLeargusHeaderView headerWithView];
//    return headerView;
//}
@end
