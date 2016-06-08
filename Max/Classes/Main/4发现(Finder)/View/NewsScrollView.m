//
//  NewsScrollView.m
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsScrollView.h"
#import "NewsWebView.h"
#import "NewsCommentTableView.h"
#import "NewsCommentModel.h"
#import "NewsReplyModel.h"
#import "NSDate+TimeAgo.h"
#import "NewsCommentLayout.h"
#import "ReplyLayout.h"

@interface NewsScrollView ()
{
    NewsWebView *_newsWebView;
    
    
    NewsCommentTableView *_commentTabelView;
}

@property (strong, nonatomic) NSArray *modelArray;
@end

@implementation NewsScrollView


- (NSArray *)modelArray {
    
    if (_modelArray == nil) {
        
        
        _modelArray = [NSArray array];
    }
    
    return _modelArray;
}

- (void)setNewsUrl:(NSString *)newsUrl {
    
    _newsUrl = newsUrl;
    

    
    _newsWebView.newsUrl = _newsUrl;
    
}

- (void)setNewsid:(NSString *)newsid {
    
    _newsid = newsid;
    
    _commentTabelView.newsid = _newsid;
    
    [self loadNewsCommentDataWithNewsid:_newsid];
    
    
    
}

- (void)loadNewsCommentDataWithNewsid:(NSString *)newsid {
    
    NSString *url = [NSString stringWithFormat:@"http://news.maxjia.com:80/maxnews/comment/getcomment/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464157138&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2&limit=30&newsid=%@&offset=0",newsid];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.modelArray = [self transportDataForArray:responseObject];
        
        _commentTabelView.commentModelArray = self.modelArray;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"读取评论数据错误:%@",error);
    }];
    
    

}



- (NSArray *)transportDataForArray:(NSDictionary *)response {
    
    NSArray *dataArray = response[@"result"][@"comments"];
    
    NSMutableArray *clipArray = [NSMutableArray array];
    
    for (NSDictionary *dic in dataArray) {
        
        NewsCommentLayout *layout = [[NewsCommentLayout alloc] init];
        
        NSArray *array = dic[@"comment"];
        
        NSDictionary *commentDic = [array firstObject];
        
        NewsCommentModel *commentModel = [[NewsCommentModel alloc] init];
        
        commentModel.avartar = commentDic[@"avartar"];
        commentModel.create_at = [self exchangeDateToString:[commentDic[@"create_at"] integerValue]];
        commentModel.userName = commentDic[@"username"];
        commentModel.text = commentDic[@"text"];
        
        NSMutableArray *modelArr = [NSMutableArray array];
        if (array.count > 1) {
            
            
            for (NSInteger i = 1; i < array.count; i ++) {
                
                NSDictionary *replyDic = array[i];
                
                NewsReplyModel *model = [[NewsReplyModel alloc] init];
                
                model.replyUserName = replyDic[@"replyusername"];
                model.userName = replyDic[@"username"];
                model.create_at = [self exchangeDateToString:[replyDic[@"create_at"] integerValue]];
                model.text = replyDic[@"text"];
                
                ReplyLayout *replyLayout = [[ReplyLayout alloc] init];
                
                replyLayout.replyModel = model;
                
                [modelArr addObject:replyLayout];
            }
            
            
        }
        
        commentModel.modelArray = modelArr;
        
        layout.commentModel = commentModel;
        
        [clipArray addObject:layout];
        
    }
    
    
    return [clipArray copy];
    
}

#pragma mark - 时间的转换处理
- (NSString *)exchangeDateToString:(NSInteger)time {
    
    
    NSDate *date = [NSDate date];
    
    //获取时间戳
    NSTimeInterval time1970 = [date timeIntervalSince1970];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSInteger clipTime = time1970 - time;
    
    //将时间差转换为消息发布时间
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-clipTime];
    
    NSString *datestr = [formatter stringFromDate:date2];
    
  
    
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *publicDate = [formatter dateFromString:datestr];
    
    return [publicDate timeAgo];
    
    
}



- (instancetype)initWithFrame:(CGRect)frame {
    
    
    if (self = [super initWithFrame:frame]) {
        
        _newsWebView = [[NewsWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.size.height)];
        
        [self addSubview:_newsWebView];
        
        _commentTabelView = [[NewsCommentTableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, self.size.height)];
        
        [self addSubview:_commentTabelView];
        self.pagingEnabled = YES;
        
        self.contentSize = CGSizeMake(kScreenWidth * 2, 0);
        
        self.showsHorizontalScrollIndicator = NO;
        
        self.showsVerticalScrollIndicator = YES;
        
        self.delegate = self;
        
        self.currentIndex = 101;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeContentScrollWithNoti:) name:@"scrollView" object:nil];
        
        
    }
    
    
    return self;
    
    
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
    
    [self setContentOffset:CGPointMake((index - 101) * kScreenWidth, 0) animated:YES];
}

- (void)dealloc {
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"scrollView" object:nil];
    
}


@end
