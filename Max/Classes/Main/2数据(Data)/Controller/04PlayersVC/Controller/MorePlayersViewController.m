//
//  MorePlayersViewController.m
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "MorePlayersViewController.h"
#import "AFNetworking.h"

@interface MorePlayersViewController ()
@property (nonatomic, strong) NSMutableArray *morePlayers;
@end

@implementation MorePlayersViewController
- (NSMutableArray *)morePlayers {

    if (!_morePlayers) {
        _morePlayers = [NSMutableArray array];
    }
    return _morePlayers;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];

    [self _setupData];
}
/**
 *  加载数据
 */
- (void)_setupData {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *recommendBodyPath = @"http://api.maxjia.com:80/api/player/verified_list/?lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464486554&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&limit=30";

    [manager GET:recommendBodyPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


//        NSArray *datas = responseObject[@"result"];

//        for (NSDictionary *dic in datas) {
//            MoreLeargusModel *moreleagues = [MoreLeargusModel yy_modelWithDictionary:dic];
//            [self.moreLeargus addObject:moreleagues];
//        }

//        NSLog(@"%@", responseObject);
//        // 2.加载UI
//        [self _setupTableView];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"error:%@",error);
        
    }];
    
}

@end
