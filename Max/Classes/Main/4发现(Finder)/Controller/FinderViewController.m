//
//  FinderViewController.m
//  Max+
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "FinderViewController.h"
#import "FinderScrollView.h"
#import "HeadView.h"
#import "FindModel.h"
#import "CommentModel.h"
#import "CommentCellLayout.h"
#import "NSDate+TimeAgo.h"

@interface FinderViewController ()

@property (strong, nonatomic) NSMutableArray *cellModelArray;

@property (strong, nonatomic) NSMutableArray *commentLayoutArray;;

@end

@implementation FinderViewController

#pragma mark - 数组的懒加载
- (NSMutableArray *)cellModelArray {
    
    if (_cellModelArray == nil) {
        
        _cellModelArray = [NSMutableArray array];
    }
    
    
    return _cellModelArray;
}

- (NSMutableArray *)commentLayoutArray {
    
    if (_commentLayoutArray == nil) {
        
        _commentLayoutArray = [NSMutableArray array];
    }
    
    
    return _commentLayoutArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadclip];
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self loadFindData];
    
    
    [self createHeadView];
}

#pragma mark - 视图的创建
- (void)createHeadView {
    


    
    HeadView *headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenHeight, 30) firstButtonName:@"新闻" lastButtonName:@"社区"];
    
    headView.backgroundColor = [UIColor colorWithRed:48 / 255.0 green:55 / 255.0 blue:73 / 255.0 alpha:1];
    
    [self.view addSubview:headView];
    
    
}

- (void)createMainView {
    
    FinderScrollView *findView = [[FinderScrollView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight - 94)];
    
    findView.commentModelArray = [self.commentLayoutArray copy];
    
    findView.findArray = [self.cellModelArray copy];
    
//    findView
    
    [self.view addSubview:findView];
    
    
    
}

- (void)loadclip {
    
    NSString *str = @"http://api.douyutv.com/3258";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:str parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    
    
}

#pragma mark - 加载数据
- (void)loadFindData {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = @"http://news.maxjia.com:80/maxnews/app/list/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146663&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30&offset=0";
    
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.cellModelArray = [[self transportDicForModel:responseObject] mutableCopy];
        
        [self loadCommentData];
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"新闻加载错误:%@",error);
    }];
    
    
    
}

- (void)loadCommentData {
    
    static NSInteger i = 0;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = @"http://news.maxjia.com:80/bbs/app/link/list?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464163014&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30";
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        self.commentLayoutArray = [[self transportCommentDic:responseObject] mutableCopy];

        if (i == 0) {
            
            [self createMainView];
        }

        i ++;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"社区加载错误%@",error);
        
    }];
    

    

    
}

#pragma mark - 日期转换
 //date = "2016-05-27 14:14:47";
- (NSString *)parseMaxDate:(NSString *)dateStr {
    
    NSString *formatter = @"yyyy-MM-dd HH:mm:ss";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = formatter;
    
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *publicDate = [dateFormatter dateFromString:dateStr];
    
    return [publicDate timeAgo];
    
}


- (NSArray *)transportDicForModel:(NSDictionary *)response {
    
    NSArray *dataArray = response[@"result"];
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *modelDic  in dataArray) {
        
        
        FindModel *model = [[FindModel alloc] init];
        
        model.click = modelDic[@"click"];
        model.content_type = modelDic[@"content_type"];
        model.date = [self parseMaxDate:modelDic[@"date"]];
        model.imageUrl = [modelDic[@"imgs"] firstObject];
        model.newsURL = modelDic[@"newUrl"];
        model.newsid = modelDic[@"newsid"];
        model.title = modelDic[@"title"];
        model.img_type = modelDic[@"img_type"];
        
        [array addObject:model];
        
    }
    
    
    
    return array;
    
}

- (NSArray *)transportCommentDic:(NSDictionary *)response {
    
    NSArray *dataArray = response[@"result"];
    
    NSMutableArray *modelArray = [NSMutableArray array];
    
    NSDate *date = [NSDate date];
    
    NSTimeInterval time1970 = [date timeIntervalSince1970];
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    for (NSDictionary *dic in dataArray) {
        
        CommentModel *model = [[CommentModel alloc] init];
        
        CommentCellLayout *layout = [[CommentCellLayout alloc] init];
        
        model.desc = dic[@"description"];
        model.linkid = dic[@"linkid"];
        model.imgsArray = dic[@"imgs"];
        model.thumbsArray = dic[@"thumbs"];
        model.title = dic[@"title"];
        model.avartar = dic[@"user"][@"avartar"];
        model.userName = dic[@"user"][@"username"];
        
        //时间的转换处理
        NSInteger time = [dic[@"create_at"] integerValue];
        
        NSInteger clipTime = time1970 - time;
        
        NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-clipTime];
        
        NSString *datestr = [formatter stringFromDate:date2];
        
        model.create_at = [self parseMaxDate:datestr];
        
        layout.commentModel = model;
        
        [modelArray addObject:layout];
    }
    
    return modelArray;
}

- (void)viewWillAppear:(BOOL)animated {
    

    
    [self loadFindData];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
