//
//  LiveCollectionView.m
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LiveCollectionView.h"
#import "LiveLargeCell.h"
#import "LiveNormalCell.h"
#import "MJRefresh.h"
#import "LiveViewController.h"
#import "VideoViewController.h"




@implementation LiveCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        
        self.delegate = self;
        
        self.dataSource = self;
        
        
        
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            
            [self loadNewData];
        }];
        
        self.liveModelArray = [NSArray array];
        
        [self registerNib:[UINib nibWithNibName:@"LiveLargeCell" bundle:nil] forCellWithReuseIdentifier:@"LiveLargeCell"];
        
        [self registerNib:[UINib nibWithNibName:@"LiveNormalCell" bundle:nil] forCellWithReuseIdentifier:@"LiveNormalCell"];
        
        
    }
    
    return self;
    
}

- (void)loadNewData {
    
    LiveViewController *liveCtr = [[LiveViewController alloc] init];
    
    NSString *url = @"http://api.maxjia.com:80/api/live/list/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146961&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30&offset=0";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.liveModelArray = [liveCtr transportDataWithDic:responseObject];
        
        [self reloadData];
        
        [self.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"刷新直播数据出错:%@",error);
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    

    
    return self.liveModelArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        
        LiveLargeCell *largeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LiveLargeCell" forIndexPath:indexPath];
        
        largeCell.liveModel = self.liveModelArray[indexPath.row];
        
        
        return largeCell;
    }else {
        
        LiveNormalCell *normalCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LiveNormalCell" forIndexPath:indexPath];
        
        
        normalCell.liveModel = self.liveModelArray[indexPath.row];
        
        
        return normalCell;
        
    }
    
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        return CGSizeMake(kScreenWidth, kScreenHeight / 3);
    }else {
        
        return CGSizeMake((kScreenWidth - 1) / 2, kScreenHeight / 5);
    }
    

}

#pragma mark - 隐藏和显示标签栏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoViewController *video = [[VideoViewController alloc] init];
    
    LiveModel *model = self.liveModelArray[indexPath.row];
    
    video.title = model.live_title;
    
       NSString *liveStr = [NSString stringWithFormat:@"http://api.maxjia.com:80/api/live/detail/v2/?live_type=%@&live_id=%@&lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464761814&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2",model.live_name,model.live_id];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    if ([model.live_name isEqualToString:@"douyu"]) {
        
        [manager POST:liveStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            NSArray *arr = responseObject[@"result"][@"stream_list"];
            
            NSString *urlStr = [arr firstObject][@"url"];
            
            NSLog(@"%@",urlStr);
            
            video.url = [NSURL URLWithString:urlStr];
            
            [[self ViewController] presentViewController:video animated:YES completion:nil];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
        
    }else {
        
        [manager GET:liveStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (![responseObject[@"msg"] isEqualToString:@""]) {
                
                NSLog(@"%@",responseObject[@"msg"]);
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"%@",responseObject[@"msg"]] preferredStyle:UIAlertControllerStyleAlert];
                
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                
                [[self ViewController] presentViewController:alert animated:YES completion:nil];
                
            }else {
                
                NSArray *arr = responseObject[@"result"][@"stream_list"];
                
                NSString *urlStr = [arr firstObject][@"url"];
                
                video.url = [NSURL URLWithString:urlStr];
                
                [[self ViewController] presentViewController:video animated:YES completion:nil];
            }
            
           
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
        
        
        
        
    }
    
    
    
    
    


    
}

@end
