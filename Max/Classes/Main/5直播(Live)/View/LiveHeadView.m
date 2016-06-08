//
//  LiveHeadView.m
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LiveHeadView.h"

@implementation LiveHeadView

- (instancetype)initWithFrame:(CGRect)frame firstButtonName:(NSString *)firstName lastButtonName:(NSString *)lastName {
    
    
    if (self = [super initWithFrame:frame]) {
        
        UIButton *newsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        newsButton.frame = CGRectMake(0, 0, 40, 20);
        newsButton.center = CGPointMake(kScreenWidth / 4, 10);
        newsButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [newsButton setTitle:firstName forState:UIControlStateNormal];
        [newsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [newsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [newsButton addTarget:self action:@selector(changeActionWithIndex:) forControlEvents:UIControlEventTouchUpInside];
        
        newsButton.tag = 101;
        [self addSubview:newsButton];
        
        UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        commentButton.frame = CGRectMake(0, 0, 40, 20);
        commentButton.center = CGPointMake( 3 * (kScreenWidth / 4), 10);
        commentButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [commentButton setTitle:lastName forState:UIControlStateNormal];
        [commentButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [commentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [commentButton addTarget:self action:@selector(changeActionWithIndex:) forControlEvents:UIControlEventTouchUpInside];
        
        commentButton.tag = 102;
        [self addSubview:commentButton];
        
        _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 10)];
        
        _selectView.image = [UIImage imageNamed:@"up_home"];
        
        _selectView.center = CGPointMake(newsButton.center.x, newsButton.center.y + 17);
        
        [self addSubview:_selectView];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeButtonSelectWithNoti:) name:@"liveHeadView" object:nil];
        
    }
    
    
    
    return self;
    
    
}

- (void)changeActionWithIndex:(UIButton *)button {
    
    
    [self changeSelectWithIndex:button.tag];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    NSDictionary *userInfo = @{
                               @"current" : [NSString stringWithFormat:@"%li",button.tag]
                               };
    
    [center postNotificationName:@"liveScrollView" object:nil userInfo:userInfo];
    
  
}

- (void)changeSelectWithIndex:(NSInteger)index {
    
    
    for (NSInteger i = 101; i < 103; i ++) {
        
        UIButton *clipButton = [self viewWithTag:i];
        
        
        [clipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        if (i == index) {
            
            [clipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _selectView.center = CGPointMake([self viewWithTag:index].center.x, [self viewWithTag:index].center.y + 17);
    }];
    
    
    
}

- (void)changeButtonSelectWithNoti:(NSNotification *)noti {
    
    NSString *str = noti.userInfo[@"current"];
    
    NSInteger index = [str integerValue];
    
    [self changeSelectWithIndex:index];
    
    
}

- (void)dealloc {
    
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"liveHeadView" object:nil];
}

@end
