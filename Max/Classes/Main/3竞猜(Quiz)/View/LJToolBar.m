//
//  LJToolBar.m
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJToolBar.h"

@interface LJToolBar ()
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSMutableArray *dividers;
@property (nonatomic, weak) UIButton *btn_first;
@property (nonatomic, weak) UIButton *btn_second;
@property (nonatomic, weak) UIButton *btn_third;

@end
@implementation LJToolBar

- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)dividers
{
    if (_dividers == nil) {
        _dividers = [NSMutableArray array];
    }
    return _dividers;
}
//- (id)initWithFrame:(CGRect)frame
//{
//   
//}
- (instancetype)initWithFrame:(CGRect)frame
               btn_firstTitle:(NSString *)btn_firstTitle btn_firstImage:(NSString *)btn_firstImage
              btn_secondTitle:(NSString *)btn_secondTitle btn_secondImage:(NSString *)btn_secondImage
               btn_thirdTitle:(NSString *)btn_thirdTitle btn_thirdImage:(NSString *)btn_thirdImage {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.添加按钮 compose_keyboardbutton_background
        self.btn_first = [self setupBtnWithTitle:btn_firstTitle image:btn_firstImage];
        self.btn_second = [self setupBtnWithTitle:btn_secondTitle image:btn_secondImage];
        self.btn_third = [self setupBtnWithTitle:btn_thirdTitle image:btn_thirdImage];
        
        // 2.添加分割线
        [self setupDivider];
        [self setupDivider];
    }
    return self;
}
/**
 *  初始化分割线
 */
- (void)setupDivider
{
    UIImageView *divider = [[UIImageView alloc] init];
    divider.image = [UIImage imageNamed:@"timeline_card_bottom_line_highlighted_os7@2x"];
    [self addSubview:divider];
    [self.dividers addObject:divider];
}

/**
 *  初始化按钮
 *
 *  @param title   按钮的文字
 *  @param image   按钮的小图片
 *  @param bgImage 按钮的背景
 */
- (UIButton *)setupBtnWithTitle:(NSString *)title image:(NSString *)image
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.adjustsImageWhenHighlighted = NO;
//    [btn setBackgroundImage:[UIImage resizedImageWithName:bgImage] forState:UIControlStateHighlighted];
    [self addSubview:btn];
    
    // 添加按钮到数组
    [self.btns addObject:btn];
    
    return btn;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置按钮的frame
    NSInteger dividerCount = self.dividers.count; // 分割线的个数
    CGFloat dividerW = 2; // 分割线的宽度
    NSInteger btnCount = self.btns.count;
    CGFloat btnW = (self.frame.size.width - dividerCount * dividerW) / btnCount;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnY = 0;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.btns[i];
        
        // 设置frame
        CGFloat btnX = i * (btnW + dividerW);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    // 2.设置分割线的frame
    CGFloat dividerH = btnH;
    CGFloat dividerY = 0;
    for (int j = 0; j<dividerCount; j++) {
        UIImageView *divider = self.dividers[j];
        
        // 设置frame
        UIButton *btn = self.btns[j];
        CGFloat dividerX = CGRectGetMaxX(btn.frame);
        divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    }
}

@end
