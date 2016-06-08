//
//  VideoTableView.m
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "VideoTableView.h"
#import "LJVideoCellTableViewCell.h"
#import "UIView+ViewController.h"
#import "LJRightVideoController.h"
#import "MJRefresh.h"

@interface VideoTableView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *titles;
@end
@implementation VideoTableView
- (NSArray *)titles {

    if (!_titles) {
        _titles = @[@"视屏列表", @"知名主播"];
    }
    return _titles;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {

    if (self = [super initWithFrame:frame style:style]) {

        self.delegate = self;
        self.dataSource = self;
//        [self _addLeftToolBar];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;


        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{

            [self loadMoreData];

        }];

        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self loadMoreHeaderDatas];
        }];
    }
    return self;
}
- (void)loadMoreHeaderDatas {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"结束刷新");
        [self.mj_header endRefreshing];
    });
}
- (void)loadMoreData {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [self.mj_footer endRefreshing];
    });
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        //        return 8;
        return 20;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        static NSString *cellIndentifier = @"liveCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }

        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"最新视屏";

        cell.imageView.image = [UIImage imageNamed:@"AppIcon29x29@3x"];
        cell.textLabel.text = label.text;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.textLabel.font = [UIFont systemFontOfSize:15];
        return cell;
    } else {

        LJVideoCellTableViewCell *cell = [LJVideoCellTableViewCell cellWithTableView:tableView];

        cell.liveModel = self.datas[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    if (section == 0) {
        return 15;
    } else
        return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        return 65;
    } else
        return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"   %@", self.titles[section]];
    label.font = [UIFont systemFontOfSize:12];
    return label;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


//    LiveModel *model = self.datas[indexPath.row];

    LJRightVideoController *videoVC = [[LJRightVideoController alloc] init];
    videoVC.title = @"视屏";
    //通过响应者链来找到相应的控制器
    UIViewController *viewCtr = [self ViewController];

    videoVC.datas = self.datas;
//    videoVC.title = model.live_id;


    [viewCtr.navigationController pushViewController:videoVC animated:YES];
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
    
    return 45;
}
@end
