//
//  LiveScrollView.m
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LiveScrollView.h"
#import "LiveCollectionView.h"
#import "VideoTableView.h"
#import "LiveLayout.h"

@interface LiveScrollView ()

@property (strong, nonatomic) LiveCollectionView *liveCollectionView;

@property (strong, nonatomic) VideoTableView *videoTableView;

@end

@implementation LiveScrollView

- (void)setModelArray:(NSArray *)modelArray {
    
    _modelArray = modelArray;
    
    _liveCollectionView.liveModelArray = _modelArray;
    self.videoTableView.datas = self.modelArray;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        LiveLayout *layout = [[LiveLayout alloc] init];
        
        _liveCollectionView = [[LiveCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.frame.size.height) collectionViewLayout:layout];
        _liveCollectionView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_liveCollectionView];
        
        _videoTableView = [[VideoTableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, self.frame.size.height-64)];
        
        [self addSubview:_videoTableView];
        
        self.pagingEnabled = YES;
        
        self.contentSize = CGSizeMake(2 * kScreenWidth, 0);
        
        self.showsHorizontalScrollIndicator = NO;
        
        self.showsVerticalScrollIndicator = YES;
        
        self.delegate = self;
        
        self.currentIndex = 101;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeContentScrollWithNoti:) name:@"liveScrollView" object:nil];
        
        
    }
    
    
    return self;
    
}

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
    
    [center postNotificationName:@"liveHeadView" object:self userInfo:userInfo];
    
    
    
}


#pragma mark - 监听按钮点击事件
- (void)changeContentScrollWithNoti:(NSNotification *)noti {
    
    
    NSString *str = noti.userInfo[@"current"];
    
    NSInteger index = [str integerValue];
    
    [self setContentOffset:CGPointMake((index - 101) * kScreenWidth, 0) animated:YES];
}

- (void)dealloc {
    
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"liveScrollView" object:nil];
}

@end
