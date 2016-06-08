//
//  LJSecondScrollView.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJSecondScrollView.h"

#import "LJLeargusView.h"
#import "LJTeamsView.h"
#import "LJRightView.h"
#import "LJTeamsRightView.h"

@interface LJSecondScrollView ()

@end
@implementation LJSecondScrollView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {

    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {

//        [self _addSupview];
    }
    return self;
}
- (void)awakeFromNib {


}
- (void)setLeagues:(NSMutableArray *)leagues {

    _leagues = leagues;

    //1. 创建6个button
    [self _addLeargusSubview];
    //2. 设置frame
//    [self _setupFrame];

}
- (void)_addLeargusSubview {
    //1. 添加view
    CGFloat margin = 10;
    CGFloat y = 0;
    CGFloat w = kScreenWidth /2 - 5*margin;
    CGFloat h = w;
    for (int i = 0; i < 5; i ++) {

        CGFloat x = i*w + (i+1)*margin;
        LJLeargusView *leargusView = [LJLeargusView leargusWithView];
//        leargusView.backgroundColor = [UIColor lightGrayColor];
        leargusView.leargusBlock = ^(NSString *name){

            if (self.leargusBlock) {
                self.leargusBlock(name);
            }
        };
        leargusView.layer.masksToBounds = YES;
        leargusView.layer.cornerRadius = 13;
        leargusView.frame = CGRectMake(x, y, w, h);
        leargusView.leaguesModel = self.leagues[i];
        [self addSubview:leargusView];
    }

    LJRightView *rightView = [LJRightView rightView];
    rightView.frame = CGRectMake(5*w + (5+1)*margin, y, w/2+margin, h);
    [self addSubview:rightView];

    rightView.moreLeargusBlock = ^(){
        if (self.moreLeargusBlock) {
            self.moreLeargusBlock();
        }
    };
}



- (void)setTeams:(NSMutableArray *)teams {

    _teams = teams;

    [self _addTeamsSubviews];
}
- (void)_addTeamsSubviews {

    //1. 添加view
    CGFloat margin = 10;
    CGFloat w = kScreenWidth /2 - 5*margin;
    CGFloat y = w * 0.05;
    CGFloat h = w * 0.8;
    for (int i = 0; i < 5; i ++) {

        CGFloat x = i*w + (i+1)*margin;
        LJTeamsView *teamsView = [LJTeamsView teamsWithView];
        teamsView.layer.masksToBounds = YES;
        teamsView.layer.cornerRadius = 15;
        teamsView.frame = CGRectMake(x, y, w, h);
        teamsView.teamsModel = self.teams[i];
        [self addSubview:teamsView];

        teamsView.teamsBlock = ^(NSString *name){
            if (self.teamsBlock) {
                self.teamsBlock(name);
            }
        };
    }

    LJTeamsRightView *rightView = [LJTeamsRightView rightView];
    rightView.frame = CGRectMake(5*w + (5+1)*margin, y, w/2+margin, h);
    [self addSubview:rightView];

    rightView.moreTeamsBlock = ^(){

        if (self.moreTeamsBlock) {
            self.moreTeamsBlock();
        }
    };
}

@end
