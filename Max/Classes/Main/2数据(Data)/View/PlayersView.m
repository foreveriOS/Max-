//
//  PlayersView.m
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "PlayersView.h"

#import "BarButtonItem.h"
#import "PlayersModel.h"
#import "LJCommonView.h"

@interface PlayersView () {

    UIImageView *iconView;
}

@end
@implementation PlayersView
- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {

        //1. 创建5个button
        [self _addBtn];
        //2. 设置frame
        [self _setupFrame];
    }
    return self;
}

- (void)setPlayers:(NSMutableArray *)players {

    _players = players;
    //1. 创建5个button
    [self _addBtn];
    //2. 设置frame
    [self _setupFrame];
}
/**
 *  1. 创建btn
 */
- (void)_addBtn {

    for (int i=0; i < 5; i ++) {
        //1. 创建按钮
        LJCommonView *item = [LJCommonView backWithView];

        //2. 设置image
        item.playersModel = self.players[i];
        item.tag = 1000 + i;

        //3. 添加
        [self addSubview:item];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    BarButtonItem *item = [UIButton buttonWithType:UIButtonTypeCustom];
//    item.titleLabel.textAlignment = NSTextAlignmentCenter;
//            item.imageView.contentMode = UIViewContentModeScaleAspectFit;
//            item.titleLabel.font = [UIFont systemFontOfSize:15];
//            [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [item setTitle:@"haha" forState:UIControlStateNormal];
//    [self clickBtn:item];
}
- (void)clickBtn:(UIButton *)button {

    if (self.playerBlock) {
        self.playerBlock(button);
    }

}

/**
 *  2. 设置frame
 */
- (void)_setupFrame {

    CGFloat btnY = 0;
    CGFloat btnW = kScreenWidth / self.subviews.count;
    CGFloat btnH = btnW * 0.66;
    for (int i=0; i<self.subviews.count; i++) {

        CGFloat btnX = i*btnW;
        LJCommonView *btn = self.subviews[i];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}


@end
