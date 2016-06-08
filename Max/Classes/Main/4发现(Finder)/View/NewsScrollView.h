//
//  NewsScrollView.h
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsScrollView : UIScrollView<UIScrollViewDelegate>

@property (assign, nonatomic) NSInteger currentIndex;

@property (copy, nonatomic) NSString *newsUrl;

@property (assign, nonatomic) NSString *newsid;

- (NSArray *)transportDataForArray:(NSDictionary *)response;
@end
