//
//  NewsTableView.m
//  Max
//
//  Created by clip on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsTableView.h"
#import "FindModel.h"
#import "NewsLargeTableViewCell.h"
#import "NewsNormalTableViewCell.h"
#import "MJRefresh.h"
#import "FinderViewController.h"
#import "NewsViewController.h"
#import "UIView+ViewController.h"

@implementation NewsTableView

- (NSArray *)modelArray {
    
    
    if (_modelArray == nil) {
        
        _modelArray = [NSArray array];
    }
    
    return _modelArray;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.delegate = self;
        
        self.dataSource = self;
        
        [self registerNib:[UINib nibWithNibName:@"NewsLargeTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewsLargeCell"];
        
        [self registerNib:[UINib nibWithNibName:@"NewsNormalTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewsNormalCell"];
        
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
    
    NSString *url = @"http://news.maxjia.com:80/maxnews/app/list/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146663&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30&offset=0";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        FinderViewController *find = [[FinderViewController alloc] init];
        
        self.modelArray = [find transportDicForModel:responseObject];
        
        [self reloadData];

        
        [self.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
        [self.mj_header endRefreshing];
    }];
    
    
    
    
    
}

- (void)loadMoreData {
    
    static NSInteger i = 1;
    
    NSInteger clip = 30 + i * 30;
    
    NSString *url = [NSString stringWithFormat:@"http://news.maxjia.com:80/maxnews/app/list/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146663&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=%li&offset=0",clip];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        FinderViewController *find = [[FinderViewController alloc] init];
        
        self.modelArray = [find transportDicForModel:responseObject];
        
        [self reloadData];
        
        [self.mj_footer endRefreshing];
        
        i ++;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    [self.mj_footer endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return self.modelArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FindModel *model = self.modelArray[indexPath.section];
    
    NSString *imageType = [NSString stringWithFormat:@"%@",model.img_type];
    
  
    if ([imageType isEqualToString:@"2"]) {
        
        NewsLargeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsLargeCell" forIndexPath:indexPath];
        
        cell.cellModel = model;
        
        return cell;
    }
    
    NewsNormalTableViewCell *normalCell = [tableView dequeueReusableCellWithIdentifier:@"NewsNormalCell" forIndexPath:indexPath];
    
    normalCell.cellModel = model;
    
    return normalCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    
    if (section == 0) {
        return 0;
    }
    
    return 4;
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FindModel *model = self.modelArray[indexPath.section];
    
    NSString *imageType = [NSString stringWithFormat:@"%@",model.img_type];
    
    if ([imageType isEqualToString:@"2"]) {
        
        
        
        return 200;
    }
    
    
    return 80;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    FindModel *model = self.modelArray[indexPath.section];
    
    NewsViewController *newsCtr = [[NewsViewController alloc] init];
    
    //通过响应者链来找到相应的控制器
    UIViewController *viewCtr = [self ViewController];
    
    newsCtr.newsUrl = model.newsURL;
    
    newsCtr.newsid = model.newsid;
    
    [viewCtr.navigationController pushViewController:newsCtr animated:YES];
    
}

@end
