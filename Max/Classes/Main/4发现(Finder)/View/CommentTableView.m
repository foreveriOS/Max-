//
//  CommentTableView.m
//  Max
//
//  Created by clip on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "CommentTableView.h"
#import "CommentCellLayout.h"
#import "CommentTableViewCell.h"
#import "MJRefresh.h"
#import "FinderViewController.h"
#import "UIView+ViewController.h"

@implementation CommentTableView

- (NSArray *)commentLayoutArray {
    
    if (_commentLayoutArray == nil) {
        
        _commentLayoutArray = [NSArray array];
    }
    
    
    return _commentLayoutArray;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.delegate = self;
        
        self.dataSource = self;
        
        [self registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"CommentCell"];
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [self loadNewData];
        }];
        
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            [self loadMoreData];
        }];
    }
    
    
    return self;
    
}

- (void)loadNewData {
    
    NSString *url =  @"http://news.maxjia.com:80/bbs/app/link/list?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464163014&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        FinderViewController *find = [[FinderViewController alloc] init];
        
        self.commentLayoutArray = [find transportCommentDic:responseObject];
        
        [self reloadData];
        
        [self.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"上拉刷新数据出错:%@",error);
    }];
    
    
}

- (void)loadMoreData {
    
    static NSInteger i = 1;
    
    NSInteger limit = i * 30 + 30;
    
    NSString *url = [NSString stringWithFormat:@"http://news.maxjia.com:80/bbs/app/link/list?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464163014&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=%li",limit];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        FinderViewController *find = [[FinderViewController alloc] init];
        
        self.commentLayoutArray = [find transportCommentDic:responseObject];
        
        [self reloadData];
        
        [self.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    i ++;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
   
    cell.cellLayout = self.commentLayoutArray[indexPath.section];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return self.commentLayoutArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    
    if (section == 0) {
        return 0;
    }
    
    return 4;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CommentCellLayout *layout = self.commentLayoutArray[indexPath.section];
    
    return layout.cellHeight;
    
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self) {
        
        //设置组头视图偏移的量，一般设置成与组头视图高度相等
        CGFloat sectionHeaderHeight = 4;
        
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0)
            
        {
            scrollView.contentInset = UIEdgeInsetsMake(- scrollView.contentOffset.y, 0, 0, 0);
            
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            
            scrollView.contentInset = UIEdgeInsetsMake(- sectionHeaderHeight, 0, 0, 0);
        }
    }
    
    static CGFloat oldContentOffset = 0;
    
    if (scrollView.contentOffset.y > oldContentOffset) {
        
        UIViewController *viewcontroller = [self ViewController];
        

    [UIView animateWithDuration:0.3 animations:^{
    
    viewcontroller.tabBarController.tabBar.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 44);
}];
        
    }else {
        
        UIViewController *viewController = [self ViewController];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            viewController.tabBarController.tabBar.frame = CGRectMake(0, kScreenHeight - 44, kScreenWidth, 44);
        }];
        
    }
    
    oldContentOffset = scrollView.contentOffset.y;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return nil;
    }
    
    UIView *backView = [[UIView alloc] init];
    
    backView.backgroundColor = [UIColor colorWithRed:226 / 255.0 green:226 / 255.0 blue:226 / 255.0 alpha:1];
    
    return backView;
    
    
    
}


@end
