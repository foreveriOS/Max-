//
//  LJRightVideoController.m
//  Max
//
//  Created by MJ on 16/6/5.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJRightVideoController.h"
#import "LJVideoCollectionCell.h"
#import "LiveLayout.h"
#import "LiveLargeCell.h"
#import "VideoViewController.h"
#import "LiveViewController.h"
#import "MJRefresh.h"

#define kCellID @"LJVideoCollectionCell"
@interface LJRightVideoController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation LJRightVideoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];
    
    LiveLayout *layout = [[LiveLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self.view addSubview:self.collectionView];

    [self.collectionView registerNib:[UINib nibWithNibName:@"LJVideoCollectionCell" bundle:nil] forCellWithReuseIdentifier:kCellID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LiveLargeCell" bundle:nil] forCellWithReuseIdentifier:@"LiveLargeCell"];


    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{


        [self loadNewData];
    }];


}
- (void)loadNewData {

    LiveViewController *liveCtr = [[LiveViewController alloc] init];

    NSString *url = @"http://api.maxjia.com:80/api/live/list/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146961&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30&offset=0";

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        self.datas = [liveCtr transportDataWithDic:responseObject];

        [self.collectionView reloadData];

        [self.collectionView.mj_header endRefreshing];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"刷新直播数据出错:%@",error);
    }];

}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//
//    return 10;
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        return CGSizeMake(kScreenWidth, kScreenWidth*0.4);
    } else
        return CGSizeMake(kScreenWidth, kScreenWidth * 0.3);
}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//
//
//}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {


    return self.datas.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {

        LiveLargeCell *largeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LiveLargeCell" forIndexPath:indexPath];

        largeCell.liveModel = self.datas[indexPath.row];
        return largeCell;
    } else{

    LJVideoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    cell.liveModel = self.datas[indexPath.row];
        return cell; }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    VideoViewController *video = [[VideoViewController alloc] init];

    LiveModel *model = self.datas[indexPath.row];

    video.title = model.live_title;

    NSString *liveStr = [NSString stringWithFormat:@"http://api.maxjia.com:80/api/live/detail/v2/?live_type=%@&live_id=%@&lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464761814&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2",model.live_name,model.live_id];


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    if ([model.live_name isEqualToString:@"douyu"]) {

        [manager POST:liveStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            NSArray *arr = responseObject[@"result"][@"stream_list"];

            NSString *urlStr = [arr firstObject][@"url"];

            NSLog(@"%@",urlStr);

            video.url = [NSURL URLWithString:urlStr];

            [self presentViewController:video animated:YES completion:nil];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        }];


    }else {

        [manager GET:liveStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            if (![responseObject[@"msg"] isEqualToString:@""]) {

                NSLog(@"%@",responseObject[@"msg"]);

                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"%@",responseObject[@"msg"]] preferredStyle:UIAlertControllerStyleAlert];

                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];

                [self presentViewController:alert animated:YES completion:nil];

            }else {

                NSArray *arr = responseObject[@"result"][@"stream_list"];

                NSString *urlStr = [arr firstObject][@"url"];

                video.url = [NSURL URLWithString:urlStr];

                [self presentViewController:video animated:YES completion:nil];
            }



        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        }];
    }
}
@end
