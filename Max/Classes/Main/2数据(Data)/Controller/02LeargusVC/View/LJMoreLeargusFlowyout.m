//
//  LJMoreLeargusFlowyout.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJMoreLeargusFlowyout.h"

#define kItemWidth ((kScreenWidth-30)/2)
@implementation LJMoreLeargusFlowyout
- (instancetype)init {

    if (self = [super init]) {

        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 10;
        self.itemSize = CGSizeMake(kItemWidth, kItemWidth);
    }
    return self;
}


@end
