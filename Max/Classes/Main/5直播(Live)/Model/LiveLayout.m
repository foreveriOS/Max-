//
//  LiveLayout.m
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LiveLayout.h"

@implementation LiveLayout

- (instancetype)init {
    
    if (self = [super init]) {
        
        
        self.minimumInteritemSpacing = 1;
        
        self.minimumLineSpacing = 1;
        
        
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    
    return self;
    
}

@end
