//
//  NewsCommentTableView.m
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsCommentTableView.h"
#import "NewsCommentCell.h"
#import "NewsCommentLayout.h"
#import "MJRefresh.h"
#import "NewsScrollView.h"

@implementation NewsCommentTableView



- (void)setCommentModelArray:(NSArray *)commentModelArray {
    
    _commentModelArray = commentModelArray;
    
    
    
    [self reloadData];
    
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        
        self.dataSource = self;
        
        self.commentModelArray = [NSArray array];
        
        [self registerNib:[UINib nibWithNibName:@"NewsCommentCell" bundle:nil] forCellReuseIdentifier:@"NewsCommentCell"];
        
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
    
   
     NSString *url = [NSString stringWithFormat:@"http://news.maxjia.com:80/maxnews/comment/getcomment/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464157138&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30&newsid=%@&offset=0",self.newsid];
    

    NewsScrollView *scrollView = [[NewsScrollView alloc] init];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.commentModelArray = [scrollView transportDataForArray:responseObject];
        
        [self reloadData];
        
        [self.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"评论更新数据错误:%@",error);
    }];
    
    
}

- (void)loadMoreData {
    
    static NSInteger i = 1;
    
    NSInteger clip = 30 * i + 30;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NewsScrollView *scrollView = [[NewsScrollView alloc] init];
    
     NSString *url = [NSString stringWithFormat:@"http://news.maxjia.com:80/maxnews/comment/getcomment/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464157138&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=%li&newsid=%@&offset=0",clip,self.newsid];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.commentModelArray = [scrollView transportDataForArray:responseObject];
        
        [self reloadData];
        
        i ++;
        
        [self.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    
    return self.commentModelArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NewsCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCommentCell" forIndexPath:indexPath];
    
    
    cell.commentLayout = self.commentModelArray[indexPath.row];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCommentLayout *layout = self.commentModelArray[indexPath.row];
    
    
    
    return layout.cellHeight;
}

@end
