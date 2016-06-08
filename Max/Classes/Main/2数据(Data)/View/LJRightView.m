//
//  LJRightView.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJRightView.h"

@implementation LJRightView

+ (instancetype)rightView {

    return [[[NSBundle mainBundle] loadNibNamed:@"LJRightView" owner:nil options:nil] lastObject];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (self.moreLeargusBlock) {
        self.moreLeargusBlock();
    }
}
@end
