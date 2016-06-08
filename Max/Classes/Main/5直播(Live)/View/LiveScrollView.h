//
//  LiveScrollView.h
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger currentIndex;

@property (strong, nonatomic) NSArray *modelArray;

@end
