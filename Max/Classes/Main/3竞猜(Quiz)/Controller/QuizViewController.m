//
//  QuizViewController.m
//  Max+
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "QuizViewController.h"
#import "AFNetworking.h"

#import "LJQuizScrollView.h"
#import "HeadView.h"
#import "QuizModel.h"
#import "LJMatchModel.h"
#import "YYModel.h"

@interface QuizViewController () 
@property (nonatomic, strong) LJQuizScrollView *ljscrollView;
@property (nonatomic, strong) HeadView *headView;
@property (assign, nonatomic) NSInteger currentIndex;
@property (nonatomic, strong) NSMutableArray *quizDatas;
@property (nonatomic, strong) NSMutableArray *matchesDatas;
//@property (nonatomic, strong) NSMutableArray *bigArray;

@end

@implementation QuizViewController
//- (NSMutableArray *)bigArray {
//
//    if (!_bigArray) {
//        _bigArray = [NSMutableArray array];
//    }
//    return _bigArray;
//}

- (NSMutableArray *)matchesDatas {

    if (!_matchesDatas) {
        _matchesDatas = [NSMutableArray array];
    }
    return _matchesDatas;
}
- (NSMutableArray *)quizDatas {
    
    if (_quizDatas == nil) {
        _quizDatas = [NSMutableArray array];
    }
    return _quizDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
     [self _setupData];
    
    [self _setupHeadView];
    
    //先加载数据，在加载UI
    [self _setupScrollView];
}

- (void)_setupHeadView {
    
    HeadView *headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30) firstButtonName:@"饰品竞猜" lastButtonName:@"M币竞猜"];
    headView.backgroundColor = [UIColor colorWithRed:48 /255.0 green:55 / 255.0 blue:73 / 255.0 alpha:1.0];
    [self.view addSubview:headView];
    self.headView = headView;
}

- (void)_setupScrollView {
    
        CGFloat scrollView_x = self.view.frame.origin.x;
        CGFloat scrollView_y = self.headView.frame.size.height;
        CGFloat scrollView_w = kScreenWidth;
        CGFloat scrollView_h = self.view.frame.size.height - scrollView_y;
        LJQuizScrollView *scrollView = [[LJQuizScrollView alloc] initWithFrame:CGRectMake(scrollView_x, scrollView_y, scrollView_w, scrollView_h)];
        [self.view addSubview:scrollView];
        self.ljscrollView = scrollView;
        
        //        [self _setupVC];
        //        [self _setupHeroVC];

    
    //传递模型
    //    self.scrollView.leafDatas = self.leafDatas;
    //    self.scrollView.rightHeroDatas = self.rightHeroDatas;
    //    self.scrollView.rightPlayerDatas = self.rightPlayerDatas;
    
}
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:@"MessageName"];
}
- (void)_setupData {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *recommendBodyPath = @"http://q.maxjia.com:80/api/bets/get_match_list_v2/3/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146903&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2";

    [manager GET:recommendBodyPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *result = responseObject[@"result"];
        NSString *message = result[@"message"];
//        self.scrollView.messageName = self.messageName;

        if (!message) {
        
            message = @"开心一刻： 😄敏俊 六一二童节快乐😄";
        }
        NSDictionary *messageDic = @{@"message" : message};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MessageName" object:self userInfo:messageDic];
        
        
     
        NSArray *datas = result[@"category_list"];

        for (NSDictionary *dic in datas) {
            QuizModel *quizModel = [QuizModel yy_modelWithDictionary:dic];
            [self.quizDatas addObject:quizModel];
            
//            for (int i = 0; i < quizModel.matches.count; i++) {
//                
//                LJMatchModel *matchModel = [LJMatchModel yy_modelWithDictionary:dic[@"matches"]]
//            }

            NSMutableArray *mactchesArr = [NSMutableArray array];
            for (NSDictionary *subdic in quizModel.matches) {
                LJMatchModel *matchModel = [LJMatchModel yy_modelWithDictionary:subdic];
                [mactchesArr addObject:matchModel];
//                [self.matchesDatas addObject:matchModel];
            }
            [self.matchesDatas addObject:mactchesArr];
            
        }

        for (int i = 0; i < self.matchesDatas.count; i ++) {
            NSArray *arr = self.matchesDatas[i];
            NSLog(@"%ld, %li", self.matchesDatas.count, arr.count);
        }
        
        
        
        self.ljscrollView.leftDatas = self.quizDatas;
        self.ljscrollView.rightDatas = self.quizDatas;
        self.ljscrollView.matchesDatas = self.matchesDatas;
        
        [self.ljscrollView.quizLeftTableView reloadData];
        [self.ljscrollView.quizRightTableView reloadData];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error:%@",error);
        
    }];
    
}

@end
