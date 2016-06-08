//
//  LJCacheCell.m
//  Max
//
//  Created by MJ on 16/6/4.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJCacheCell.h"

@implementation LJCacheCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.cacheView.text = @"0.0";
}
+ (instancetype)cacheWithCell {

    return [[[NSBundle mainBundle] loadNibNamed:@"LJCacheCell" owner:nil options:nil] lastObject];
}
@end
