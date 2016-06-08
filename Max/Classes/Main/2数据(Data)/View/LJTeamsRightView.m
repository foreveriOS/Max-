//
//  LJTeamsRightView.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJTeamsRightView.h"

@implementation LJTeamsRightView

+ (instancetype)rightView {

    return [[[NSBundle mainBundle] loadNibNamed:@"LJTeamsRightView" owner:nil options:nil] lastObject];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (self.moreTeamsBlock) {
        self.moreTeamsBlock();
    }
}

@end
