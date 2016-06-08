//
//  TabBar.m
//  网易彩票
//
//  Created by mac on 16/4/2.
//  Copyright © 2016年 LJ. All rights reserved.
//
#import "BarButtonItem.h"

#import "TabBar.h"

@interface TabBar ()

/**
 *  1. 记录当前选中的按钮
 */
@property (strong, nonatomic) UIButton *selecteBtn;

@end

@implementation TabBar

/**
 *  2. custom按钮
 */
- (void)addBarButttonItemWithName:(NSString *)name selecteName:(NSString *)selecteName itemName:(NSString *)itemName {

    //1. 创建按钮
    BarButtonItem *item = [BarButtonItem buttonWithType:UIButtonTypeCustom];

    //2. 设置属性和图片
    item.titleLabel.textAlignment = NSTextAlignmentCenter;
//    item.imageView.clipsToBounds = YES;
    item.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    item.imageView.contentMode = UIViewContentModeScaleToFill;
    item.titleLabel.font = [UIFont systemFontOfSize:13];
    [item setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];

    [item setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selecteName] forState:UIControlStateSelected];

    //2.01 设置title
    [item setTitle:itemName forState:UIControlStateNormal];

    //3. 添加
    [self addSubview:item];

    //4. 监听点击事件
    [item addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];

    //5. 默认选中第一个
    if (self.subviews.count == 1) {

        [self buttonAction:item];
    }
}


/**
 *  4. 监听按钮点击
 */
- (void)buttonAction:(UIButton *)button {

        //1. 通知代理切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelecteItemFrom:to:)]) {
        [self.delegate tabBar:self didSelecteItemFrom:(int)self.selecteBtn.tag - 1000 to:(int)button.tag - 1000];
    }
        //2. 选中按钮->取消选中
    self.selecteBtn.selected = NO;

        //3. 当前 选中按钮->选中
    button.selected = YES;

        //4. 新点击的按钮-> 成为选中按钮
    self.selecteBtn = button;

}

/**
 *  3. 设置frame
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnY = 0;
    CGFloat btnH = self.frame.size.height;

    for (int i = 0; i < self.subviews.count; i ++) {
        BarButtonItem *item = self.subviews[i];
        item.tag = i + 1000;

        CGFloat btnW = self.frame.size.width / self.subviews.count;
        CGFloat btnX = btnW * i;
        self.subviews[i].frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

@end
