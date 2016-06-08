//
//  FinderScrollView.h
//  Max
//
//  Created by clip on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsTableView.h"

@interface FinderScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) NSArray *findArray;

@property (nonatomic, strong) NSArray *commentModelArray;

@property (strong, nonatomic) NewsTableView *newsView;
@end
