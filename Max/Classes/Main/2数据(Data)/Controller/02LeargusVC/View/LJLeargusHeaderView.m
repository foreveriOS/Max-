//
//  LJLeargusHeaderView.m
//  Max
//
//  Created by MJ on 16/6/5.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLeargusHeaderView.h"

@implementation LJLeargusHeaderView

+ (instancetype)headerWithView {

    return [[[NSBundle mainBundle] loadNibNamed:@"LJLeargusHeaderView" owner:nil options:nil] lastObject];
}

@end
