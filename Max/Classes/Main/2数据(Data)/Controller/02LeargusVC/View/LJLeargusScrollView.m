//
//  LJLeargusScrollView.m
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLeargusScrollView.h"

#import "LJLeargusLeftTableView.h"
#import "LJLeargusRightTableView.h"

@interface LJLeargusScrollView ()

@end
@implementation LJLeargusScrollView
- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        //添加tableview
        self.contentSize = CGSizeMake(kScreenWidth * 2, self.bounds.size.height);
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        [self _setupLeftTableView];
        [self _setupRightTableView];
    }
    return self;
}

- (void)_setupLeftTableView {

    LJLeargusLeftTableView *leftTableView = [[LJLeargusLeftTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.bounds.size.height)];
    [self addSubview:leftTableView];
    self.leftTableView = leftTableView;
    self.leftTableView.backgroundColor = [UIColor clearColor];
    leftTableView.rightHeroBlock = ^{
        if (self.rightHeroBlock) {
            self.rightHeroBlock();
        }
    };
}
- (void)setLeafDatas:(NSMutableArray *)leafDatas {

    _leafDatas = leafDatas;
    self.leftTableView.leafDatas = self.leafDatas;
}




- (void)_setupRightTableView {

    LJLeargusRightTableView *rightTableView = [[LJLeargusRightTableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, self.bounds.size.height)];
    [self addSubview:rightTableView];
    self.rightTableView = rightTableView;
    self.rightTableView.backgroundColor = [UIColor clearColor];
    
    rightTableView.rightPlayersDatasBlock = ^{
        if (self.rightPlayersDatasBlock) {
            self.rightPlayersDatasBlock();
        }
    };
}
- (void)setRightHeroDatas:(NSMutableArray *)rightHeroDatas {

    _rightHeroDatas = rightHeroDatas;
    self.rightTableView.rightHeroDatas = self.rightHeroDatas;
}
- (void)setRightPlayerDatas:(NSMutableArray *)rightPlayerDatas {

    _rightPlayerDatas = rightPlayerDatas;
    self.rightTableView.rightPlayerDatas = self.rightPlayerDatas;
}
@end
