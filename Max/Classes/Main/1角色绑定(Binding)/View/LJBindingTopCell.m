//
//  LJBindingTopCell.m
//  Max
//
//  Created by MJ on 16/6/4.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJBindingTopCell.h"

@implementation LJBindingTopCell
+ (instancetype)bindingWithCell {

    return [[[NSBundle mainBundle] loadNibNamed:@"LJBindingTopCell" owner:nil options:nil] lastObject];
}
- (void)awakeFromNib {
    [super awakeFromNib];

    self.iconView.image = [UIImage imageNamed:@"icon_face_selected"];
    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.cornerRadius = kScreenWidth/3 * 0.75 * 0.1;

    self.titleView.text = @"搜索并绑定你的账号";
}



@end
