//
//  LiveViewController.m
//  Max+
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveHeadView.h"
#import "LiveScrollView.h"
#import "LiveModel.h"

@interface LiveViewController ()

@property (strong, nonatomic) NSArray *liveModelArray;


@end

@implementation LiveViewController

- (NSArray *)liveModelArray {
    
    if (_liveModelArray == nil) {
        
        
        _liveModelArray = [NSArray array];
        
    }
    
    return _liveModelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    
    [self createHeadView];
    
    [self loadLiveData];
    
    
   
    
}


- (void)createHeadView {
    
    
    
    
    LiveHeadView *headView = [[LiveHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenHeight, 30) firstButtonName:@"直播" lastButtonName:@"视频"];
    
    headView.backgroundColor = [UIColor colorWithRed:48 / 255.0 green:55 / 255.0 blue:73 / 255.0 alpha:1];
    
    [self.view addSubview:headView];
    
    
}

- (void)createMainView {
    
    LiveScrollView *scrollView = [[LiveScrollView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight - 94)];
    
    scrollView.modelArray = self.liveModelArray;
    
    [self.view addSubview:scrollView];
    
}

- (void)loadLiveData {
    
    static NSInteger i = 0;
    
    NSString *url = @"http://api.maxjia.com:80/api/live/list/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146961&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30&offset=0";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        self.liveModelArray = [self transportDataWithDic:responseObject];
        
        
        if (i == 0) {
            
            [self createMainView];
        }
        
        i ++;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        NSLog(@"直播数据加载错误:%@",error);
    }];
    
    
    
    
}





- (NSArray *)transportDataWithDic:(NSDictionary *)response {
    
    NSArray *dataArr = response[@"result"];
    
    NSMutableArray *modelarr = [NSMutableArray array];
    
    for (NSDictionary *liveDic in dataArr) {
        
        LiveModel *model = [[LiveModel alloc] init];
    
        model.live_id = liveDic[@"live_id"];
        model.live_img = liveDic[@"live_img"];
        model.live_name = liveDic[@"live_name"];
        model.live_nickname = liveDic[@"live_nickname"];
        model.live_online = [NSString stringWithFormat:@"%@",liveDic[@"live_online"]];
        model.live_title = liveDic[@"live_title"];
        model.live_userimg = liveDic[@"live_userimg"];
        
        [modelarr addObject:model];
    }
    
    
    return [modelarr copy];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    [self loadLiveData];
}

@end
