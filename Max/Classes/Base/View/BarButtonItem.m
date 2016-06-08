//
//  BarButtonItem.m
//  网易彩票
//
//  Created by mac on 16/4/2.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "BarButtonItem.h"

@implementation BarButtonItem

- (void)setHighlighted:(BOOL)highlighted { }
- (CGRect)titleRectForContentRect:(CGRect)contentRect {

    return CGRectMake(0, self.bounds.size.height * 0.5 + 3, self.bounds.size.width, self.bounds.size.height / 2.0 - 3);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {

    return CGRectMake(0, 3, self.bounds.size.width, self.bounds.size.height * 0.5);
}

@end
