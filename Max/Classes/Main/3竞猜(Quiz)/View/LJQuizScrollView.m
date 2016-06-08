//
//  LJQuizScrollView.m
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJQuizScrollView.h"
#import "LJQuizRightTableView.h"
#import "LJQuizLeftTableView.h"


@interface LJQuizScrollView () <UIScrollViewDelegate>
@property (nonatomic, assign) NSInteger currentIndex;

//@property (nonatomic, strong) LJQuizLeftTableView *leftTableView;
//@property (nonatomic, strong) LJQuizRightTableView *rightTableView;



@end
@implementation LJQuizScrollView
- (void)setMatchesDatas:(NSArray *)matchesDatas {
    
    _matchesDatas = matchesDatas;
    self.quizLeftTableView.matchesDatas = matchesDatas;
    self.quizRightTableView.matchesDatas = matchesDatas;
}
- (void)setLeftDatas:(NSArray *)leftDatas {
    
    _leftDatas = leftDatas;
    self.quizLeftTableView.leftDatas = self.leftDatas;
}
- (void)setRightDatas:(NSArray *)rightDatas {
    
    _rightDatas = rightDatas;
    self.quizRightTableView.rightDatas = self.rightDatas;
}
//- (void)setFindArray:(NSArray *)findArray {
//    
//    _findArray = findArray;
//    _newsView.frame = CGRectMake(0, 0, kScreenWidth, self.size.height);
//    _newsView.modelArray = _findArray;
//}

//- (void)setCommentModelArray:(NSArray *)commentModelArray {
//    _commentModelArray = commentModelArray;
//    _commentView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, self.size.height);
//    _commentView.commentLayoutArray = _commentModelArray;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        [self _addTableView];
        [self _setupSelf];
    }
    return self;
}


- (void)_setupSelf {
    
    self.pagingEnabled = YES;
    self.contentSize = CGSizeMake(2 * kScreenWidth, 0);
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = YES;
    self.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    
    self.currentIndex = 101;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeContentScrollWithNoti:) name:@"scrollView" object:nil];
}

//- (NSString *)messageName {
//    
//    if (!_messageName) {
//        _messageName = [NSString string];
//    }
//    return _messageName;
//}


//- (void)_addHeadView {
//    
//    [self _addLeftToolBar];
//    [self _addRightToolBar];
//}
- (void)_addTableView {
    
    self.quizLeftTableView = [[LJQuizLeftTableView alloc] init];
    self.quizLeftTableView.frame = CGRectMake(0, 0, kScreenWidth, self.frame.size.height - 113);
    [self addSubview:self.quizLeftTableView];
    
    self.quizRightTableView = [[LJQuizRightTableView alloc] init];
    self.quizRightTableView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, self.frame.size.height - 113);
    [self addSubview:self.quizRightTableView];
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

#pragma mark - 监听tableView下拉偏移量

@end
