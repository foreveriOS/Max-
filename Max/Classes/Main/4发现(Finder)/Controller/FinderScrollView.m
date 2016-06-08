//
//  FinderScrollView.m
//  Max
//
//  Created by clip on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "FinderScrollView.h"

#import "CommentTableView.h"

@interface FinderScrollView ()



@property (strong, nonatomic) CommentTableView *commentView;

@end

@implementation FinderScrollView

- (void)setFindArray:(NSArray *)findArray {
    
        _findArray = findArray;
    
        _newsView.frame = CGRectMake(0, 0, kScreenWidth, self.size.height);
        
        
        _newsView.modelArray = _findArray;

    
}

- (void)setCommentModelArray:(NSArray *)commentModelArray {
    
    _commentModelArray = commentModelArray;
    
    _commentView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, self.size.height);
    
    _commentView.commentLayoutArray = _commentModelArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _newsView = [[NewsTableView alloc] initWithFrame:CGRectZero];
    
        
        [self addSubview:_newsView];
        
        _commentView = [[CommentTableView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:_commentView];
        
        self.findArray = [NSArray array];
        
        self.pagingEnabled = YES;
        
        self.contentSize = CGSizeMake(2 * kScreenWidth, 0);
        
        self.showsHorizontalScrollIndicator = NO;
        
        self.showsVerticalScrollIndicator = YES;
        
        self.delegate = self;
        
        self.currentIndex = 101;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeContentScrollWithNoti:) name:@"scrollView" object:nil];
        
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
    
    [center postNotificationName:@"headView" object:self userInfo:userInfo];
    
    
    
    
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
