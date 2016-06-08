//
//  LeaguesController.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LeaguesController.h"
#import "ShowDetailsViewController.h"

#import "HeadView.h"
#import "LJLeargusScrollView.h"

#import "AFNetworking.h"
#import "YYModel.h"
#import "LJPlayersModel.h"
#import "LJPlayersHeroModel.h"
#import "LJPlayersDataModel.h"


@interface LeaguesController () <UIScrollViewDelegate>
@property (nonatomic, strong) LJLeargusScrollView *scrollView;
@property (nonatomic, strong) HeadView *headView;
@property (nonatomic, strong) NSMutableArray *leafDatas;
@property (nonatomic, strong) NSMutableArray *rightHeroDatas;
@property (nonatomic, strong) NSMutableArray *rightPlayerDatas;
@property (assign, nonatomic) NSInteger currentIndex;


@end

@implementation LeaguesController
- (NSMutableArray *)leafDatas {
    if (!_leafDatas) {
        _leafDatas = [NSMutableArray array];
    }
    return _leafDatas;
}
- (NSMutableArray *)rightHeroDatas {
    if (!_rightHeroDatas) {
        _rightHeroDatas = [NSMutableArray array];
    }
    return _rightHeroDatas;
}
- (NSMutableArray *)rightPlayerDatas {
    if (!_rightPlayerDatas) {
        _rightPlayerDatas = [NSMutableArray array];
    }
    return _rightPlayerDatas;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];

    [self _setupData];

    [self _setupHeadView];
}

- (void)_setupHeadView {

     HeadView *headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30) firstButtonName:@"赛程" lastButtonName:@"赛事数据"];
    headView.backgroundColor = [UIColor colorWithRed:48 /255.0 green:55 / 255.0 blue:73 / 255.0 alpha:1.0];
    [self.view addSubview:headView];
    self.headView = headView;
    


}



#pragma mark - 监听滑动偏移量
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    
    CGFloat contentOffsetX = targetContentOffset -> x;
    
    NSInteger pageWidth = kScreenWidth;
    
    NSInteger pageNum = (contentOffsetX + pageWidth / 2) / pageWidth;
    
    pageNum = velocity.x == 0 ? pageNum : (velocity.x > 0 ? pageNum + 1 : pageNum - 1);
    
    pageNum = MIN(MAX(pageNum, 0), 1);
    
    targetContentOffset -> x = pageNum * pageWidth;
    
    self.currentIndex = 101 + pageNum;
    
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    NSDictionary *userInfo = @{
                               @"current" : [NSString stringWithFormat:@"%li",self.currentIndex]
                               };
    
    [center postNotificationName:@"newsHeadView" object:self userInfo:userInfo];
    
    
    
}

#pragma mark - 监听按钮点击事件
- (void)changeContentScrollWithNoti:(NSNotification *)noti {
    
    
    NSString *str = noti.userInfo[@"current"];
    
    NSInteger index = [str integerValue];
    
    [self.scrollView setContentOffset:CGPointMake((index - 101) * kScreenWidth, 0) animated:YES];
}

- (void)dealloc {
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"scrollView" object:nil];
    
}



- (void)_setupScrollView {

    if (!self.scrollView) {

    CGFloat scrollView_x = self.view.frame.origin.x;
    CGFloat scrollView_y = self.headView.frame.size.height;
    CGFloat scrollView_w = kScreenWidth;
    CGFloat scrollView_h = self.view.frame.size.height - scrollView_y;
    LJLeargusScrollView *scrollView = [[LJLeargusScrollView alloc] initWithFrame:CGRectMake(scrollView_x, scrollView_y, scrollView_w, scrollView_h)];
        scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
       
        [self _setupVC];
        [self _setupHeroVC];
        
        self.currentIndex = 101;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeContentScrollWithNoti:) name:@"scrollView" object:nil];

    }

    //传递模型
    self.scrollView.leafDatas = self.leafDatas;
    self.scrollView.rightHeroDatas = self.rightHeroDatas;
    self.scrollView.rightPlayerDatas = self.rightPlayerDatas;

}

/**
 *  4.VC
 */
- (void)_setupVC {
  
    __weak typeof(self)weakself = self;
    
    self.scrollView.rightPlayersDatasBlock = ^(){
        
        ShowDetailsViewController *leargusVC = [[ShowDetailsViewController alloc] init];;
//        leargusVC.title = name;
        [weakself.navigationController pushViewController:leargusVC animated:YES];
    };
}
- (void)_setupHeroVC {
    
    __weak typeof(self)weakself = self;
    
    self.scrollView.rightHeroBlock = ^(){
        
        ShowDetailsViewController *leargusVC = [[ShowDetailsViewController alloc] init];;
        //        leargusVC.title = name;
        [weakself.navigationController pushViewController:leargusVC animated:YES];
    };
}



- (void)_setupUI {
    [self _setupScrollView];
}
/**
 *  加载数据
 */
- (void)_setupData {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *recommendBodyPath = @"http://api.maxjia.com:80/api/league/get_league_schedule/?&lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464486658&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&leagueid=4478&start_time=0";

    [manager GET:recommendBodyPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary *datas = responseObject[@"result"];

        NSArray *leftDatas = datas[@"category_list"];
        for (NSDictionary *dic in leftDatas) {
            LJPlayersModel *playersModel = [LJPlayersModel yy_modelWithJSON:dic];

            [self.leafDatas addObject:playersModel];
        }

        [self _setupHeroData];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"error:%@",error);
        
    }];
    
}

/**
 *  加载数据
 */
- (void)_setupHeroData {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *recommendBodyPath = @"http://api.maxjia.com:80/api/league/get_league_hero_stats/?&lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464486781&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&league_id=4478";

    [manager GET:recommendBodyPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSArray *datas = responseObject[@"result"];

        for (NSDictionary *dic in datas) {
            LJPlayersHeroModel *playersHeroModel = [LJPlayersHeroModel yy_modelWithJSON:dic];

            [self.rightHeroDatas addObject:playersHeroModel];
        }

        [self _setupPlayerData];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"error:%@",error);
        
    }];
    
}

/**
 *  加载数据
 */
- (void)_setupPlayerData {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *recommendBodyPath = @"http://api.maxjia.com:80/api/league/get_league_player_stats/?&lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464486782&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&league_id=4478";

    [manager GET:recommendBodyPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSArray *datas = responseObject[@"result"];

        for (NSDictionary *dic in datas) {
            LJPlayersDataModel *playersDataModel = [LJPlayersDataModel yy_modelWithJSON:dic];

            [self.rightPlayerDatas addObject:playersDataModel];
        }

        // 2.加载UI
        [self _setupUI];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"error:%@",error);
        
    }];
    
}

@end
