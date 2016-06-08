//
//  DataViewController.m
//  Max+
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "DataViewController.h"

#import "ShowDetailsViewController.h"
#import "MorePlayersViewController.h"
#import "PlayersViewController.h"
#import "LeaguesController.h"
#import "TeamsController.h"
#import "LJMoreleargesController.h"
#import "LJMoreTeamsController.h"

#import "DataTableView.h"
#import "AFNetworking.h"
#import "YYModel.h"

#import "LeaguesModel.h"
#import "TeamsModel.h"
#import "PlayersModel.h"


@interface DataViewController () <LJDidClickdButtonDelegate>
@property (nonatomic, strong) DataTableView *tableView;

@property (nonatomic, strong) NSMutableArray *leaguesdatas;
@property (nonatomic, strong) NSMutableArray *teamsdatas;
@property (nonatomic, strong) NSMutableArray *playersdatas;

@property (nonatomic, strong) NSArray *playersWebViewDatas;
@end

@implementation DataViewController
- (NSArray *)playersWebViewDatas {

    if (!_playersWebViewDatas) {
        _playersWebViewDatas = @[@"http://epicenter.gg",
                                 @"http://www.esl-one.com/dota2/manila-2016/",
                                 @"http://beyondthesummit.tv/announcing-bts-americas-2/",
                                 @"http://weplay.tv/dota2",
                                 @"http://www.dota2.com"];
    }
    return _playersWebViewDatas;
}
- (NSMutableArray *)leaguesdatas {
    if (!_leaguesdatas) {
        _leaguesdatas = [NSMutableArray array];
    }
    return _leaguesdatas;
}
- (NSMutableArray *)teamsdatas {
    if (!_teamsdatas) {
        _teamsdatas = [NSMutableArray array];
    }
    return _teamsdatas;
}
- (NSMutableArray *)playersdatas {
    if (!_playersdatas) {
        _playersdatas = [NSMutableArray array];
    }
    return _playersdatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    
    // 1.加载数据
    [self _setupData];
    
//            [self _setupTableView];

}
/**
 *  加载UI
 */
- (void)_setupTableView {

    // 1.加载列表视图
    self.tableView = [[DataTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 113)];

    self.tableView.delegate2 = self;
    [self.view addSubview:self.tableView];

    // 2.传值
    self.tableView.leagues = self.leaguesdatas;
    self.tableView.teams = self.teamsdatas;
    self.tableView.players = self.playersdatas;

    // 3.二级控制器push
    [self _pushVC];
}
- (void)_pushVC {

    [self _setupPlayersVC];
    [self _setupMorePlayerVC];
    [self _setupLeargusVC];
    [self _setupTeamsVC];
    [self _setupMoreLeargusVC];
    [self _setupMoreTeamsVC];
}
#pragma mark - LJDidClickdButtonDelegate
/**
 *  1.英雄VC
 */
- (void)didclickBtn:(UIButton *)button {

    ShowDetailsViewController *showVC = [[ShowDetailsViewController alloc] init];
    showVC.title = button.titleLabel.text;

    [self.navigationController pushViewController:showVC animated:YES];
}
/**
 *  2.玩家VC
 *
 *  @parameter block的使用注意事项：这儿会造成循环引用
 */
- (void)_setupPlayersVC {

    __weak typeof(self)weakself = self;

    self.tableView.playersBlock = ^(UIButton *button){

        NSInteger tag = button.tag - 1000;
        PlayersViewController *playersVC = [[PlayersViewController alloc] init];;
        playersVC.title = button.titleLabel.text;
        playersVC.webText = self.playersWebViewDatas[tag];
        [weakself.navigationController pushViewController:playersVC animated:YES];
    };
}

/**
 *  3.更多玩家VC
 */
- (void)_setupMorePlayerVC {

    __weak typeof(self)weakself = self;

    self.tableView.morePlayersBlock = ^{

        LeaguesController *morePlayersVC = [[LeaguesController alloc] init];;
        morePlayersVC.title = @"知名玩家";
        [weakself.navigationController pushViewController:morePlayersVC animated:YES];
    };
}
/**
 *  4.联赛VC
 */
- (void)_setupLeargusVC {

    __weak typeof(self)weakself = self;

    self.tableView.leargusBlock = ^(NSString *name){

        LeaguesController *leargusVC = [[LeaguesController alloc] init];;
        leargusVC.title = name;
        [weakself.navigationController pushViewController:leargusVC animated:YES];
    };
}
/**
 *  5.战队VC
 */
- (void)_setupTeamsVC {

    __weak typeof(self)weakself = self;

    self.tableView.teamsBlock = ^(NSString *name){

        LeaguesController *teamsVC = [[LeaguesController alloc] init];;
        teamsVC.title = name;
        [weakself.navigationController pushViewController:teamsVC animated:YES];
    };
}
/**
 *  6.更多联赛VC
 */
- (void)_setupMoreLeargusVC {

    __weak typeof(self)weakself = self;

    self.tableView.moreLeargusBlock = ^(){

        LJMoreleargesController *moreLeargesVC = [[LJMoreleargesController alloc] init];;
        moreLeargesVC.title = @"全部联赛";
        [weakself.navigationController pushViewController:moreLeargesVC animated:YES];
    };
}
/**
 *  7.更多战队VC
 */
- (void)_setupMoreTeamsVC {

    __weak typeof(self)weakself = self;
    self.tableView.moreTeamsBlock = ^(){

        LJMoreleargesController *moreTeamsVC = [[LJMoreleargesController alloc] init];;
        moreTeamsVC.title = @"职业战队";
        [weakself.navigationController pushViewController:moreTeamsVC animated:YES];
    };
}

/**
 *  加载数据
 */
- (void)_setupData {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *recommendBodyPath = @"http://api.maxjia.com:80/api/league/get_league_index/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146768&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2";

    [manager GET:recommendBodyPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        /* "result":{
                 "leagues":Array[5],
                 "players":Array[6],
                 "teams":Array[5]
             },
         */

        NSDictionary *datas = responseObject[@"result"];

        NSArray *leaguesdatas = [NSArray array];
        NSArray *teamsdatas = [NSArray array];
        NSArray *playersdatas = [NSArray array];
        leaguesdatas = datas[@"leagues"];
        teamsdatas = datas[@"teams"];
        playersdatas = datas[@"players"];

        for (NSDictionary *dic in leaguesdatas) {
            LeaguesModel *leagues = [LeaguesModel yy_modelWithDictionary:dic];
            [self.leaguesdatas addObject:leagues];
        }
        for (NSDictionary *dic in teamsdatas) {
            TeamsModel *teams = [TeamsModel yy_modelWithDictionary:dic];
            [self.teamsdatas addObject:teams];
        }
        for (NSDictionary *dic in playersdatas) {
            PlayersModel *players = [PlayersModel yy_modelWithDictionary:dic];
            [self.playersdatas addObject:players];
        }




        // 2.加载UI
        [self _setupTableView];
//        [self.tableView reloadData];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

            NSLog(@"error:%@",error);
            
        }];
        
}

/**
 *  通过code换取一个accessToken
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
- (void)accessTokenWithCode:(NSString *)code
{
    // AFNetworking\AFN
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"1359433872";
    params[@"client_secret"] = @"37c372aa97a9329fc561947151c1bd38";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://ios.itcast.cn";

    // 3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          // 4.先将字典转为模型
          IWAccount *account = [IWAccount accountWithDict:responseObject];

          // 5.存储模型数据
          [IWAccountTool saveAccount:account];

          // 6.新特性\去首页
          [IWWeiboTool chooseRootController];

          // 7.隐藏提醒框
          [MBProgressHUD hideHUD];
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          // 隐藏提醒框
          [MBProgressHUD hideHUD];
      }];
 } */

@end
