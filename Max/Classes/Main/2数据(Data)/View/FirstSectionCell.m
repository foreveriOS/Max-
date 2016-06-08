//
//  FirstSectionCell.m
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "FirstSectionCell.h"

#import "BarButtonItem.h"


@interface FirstSectionCell ()
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *icons;
@end
@implementation FirstSectionCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"FirstCellID";

    FirstSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[FirstSectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}


- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"英雄", @"英雄榜", @"物品", @"天梯"];
    }
    return _titles;
}
- (NSArray *)icons {
    if (!_icons) {
        _icons =  @[
                    @"icon_face_selected",
                    @"icon_data_selected",
                    @"icon_guess_selected",
                    @"icon_find_selected"];
    }
    return _icons;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1. 创建4个button
        [self _addBtn];

        //2. 设置frame
        [self _setupFrame];
    }
    return self;
}
/**
 *  1. 创建btn
 */
- (void)_addBtn {

    for (int i=0; i < 4; i ++) {
        //1. 创建按钮
        BarButtonItem *item = [BarButtonItem buttonWithType:UIButtonTypeCustom];

        //2. 设置属性和图片
        item.titleLabel.textAlignment = NSTextAlignmentCenter;
        item.imageView.contentMode = UIViewContentModeScaleAspectFit;
        item.titleLabel.font = [UIFont systemFontOfSize:13];
        [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [item setImage:[UIImage imageNamed:self.icons[i]] forState:UIControlStateNormal];

        item.layer.cornerRadius = 15;

        //2. 设置title
        [item setTitle:self.titles[i] forState:UIControlStateNormal];
        item.tag = 100 + i;
//        NSLog(@"%@", item);

        //3. 添加
        [self.contentView addSubview:item];

        //4. 监听点击事件
        [item addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];

    }
    
}
- (void)clickBtn:(UIButton *)button {

    if ([self.delegate respondsToSelector:@selector(didclickButton:)]) {
        [self.delegate didclickButton:button];
    }
}

/**
 *  2. 设置frame
 */
- (void)_setupFrame {

    CGFloat btnY = 5;
    CGFloat btnW = kScreenWidth / self.contentView.subviews.count;
    CGFloat btnH = btnW - 30;
    for (int i=0; i<self.contentView.subviews.count; i++) {

        CGFloat btnX = i*btnW;
        UIButton *btn = self.contentView.subviews[i];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}


@end
