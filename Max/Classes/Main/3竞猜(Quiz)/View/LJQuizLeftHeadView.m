
//
//  LJQuizLeftHeadView.m
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJQuizLeftHeadView.h"
#import "LJToolBar.h"
#import "LJLoadMoreView.h"

@interface LJQuizLeftHeadView ()
@property (nonatomic, strong) LJToolBar *toolBar;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) LJLoadMoreView *moreView;

@property (nonatomic, strong) UIView *messageVier;
@end
@implementation LJQuizLeftHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        [self _addToolBar];
        [self _addView];
//        [self _addMoreView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addUI:) name:@"MessageName" object:nil];
    }
    return self;
}
- (void) _addToolBar {
    
    LJToolBar *toolBar = [[LJToolBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40) btn_firstTitle:@"我的库存" btn_firstImage:@"save_icon_highlighted" btn_secondTitle:@"竞猜排名" btn_secondImage:@"microphone@2x" btn_thirdTitle:@"我的竞猜" btn_thirdImage:@"info"];
    toolBar.backgroundColor = [UIColor whiteColor];
    [self addSubview:toolBar];
    self.toolBar = toolBar;
}
- (void)_addView {
#warning background
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.toolBar.frame), kScreenWidth, 30)];
    [self addSubview:view];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    lable1.font = [UIFont systemFontOfSize:13];
    lable1.textAlignment = NSTextAlignmentCenter;
    lable1.text = @"暂无库存";
    [view addSubview:lable1];

    self.view = view;
    
 
}

- (void)addUI:(NSNotification *)noti {
    NSDictionary *mesageDic = noti.userInfo;
    
    if (!mesageDic[@"message"]) {
        
        [self _addMoreView];
        self.frame = CGRectMake(0, 0, kScreenWidth, 100);
        return;
    };
//    self.frame = CGRectMake(0, 0, kScreenWidth, 50);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:view];
    
//#warning NSLog(...)
    view.backgroundColor = [UIColor lightGrayColor];
    self.messageVier = view;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.messageVier.frame.size.width - self.messageVier.frame.size.height, self.messageVier.frame.size.height)];
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%@", mesageDic[@"message"]];
    [self.messageVier addSubview:label];
    
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:@"CloseButton"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(CGRectGetMaxX(label.frame), 0, self.messageVier.frame.size.height, self.messageVier.frame.size.height);
    btn.contentMode = UIViewContentModeScaleAspectFit;
    [btn addTarget:self action:@selector(removeMessageView) forControlEvents:UIControlEventTouchDown];
    [self.messageVier addSubview:btn];


}
- (void)removeMessageView {
    
    [self.messageVier removeFromSuperview];
}
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:@"MessageName"];
}



- (void)_addMoreView {
    
    LJLoadMoreView *moreView = [[LJLoadMoreView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame), self.frame.size.width, 30)title:@"加载全部" image:@"common_icon_arrow@2x"];
    [self addSubview:moreView];
    self.moreView = moreView;
}
@end
