//
//  LJQuizRightHeadView.m
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJQuizRightHeadView.h"
#import "LJToolBar.h"
#import "LJLoadMoreView.h"

@interface LJQuizRightHeadView ()
@property (nonatomic, strong) LJToolBar *toolBar;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) LJLoadMoreView *moreView;

@property (nonatomic, strong) UIView *messageVier;
@end
@implementation LJQuizRightHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        //1. 添加toolBar
        [self _addToolBar];
        [self _addView];

        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addUI:) name:@"MessageName" object:nil];

    }
    return self;
}
- (void)_addToolBar {
    
    LJToolBar *toolBar = [[LJToolBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40) btn_firstTitle:@"M币商城" btn_firstImage:@"compose_keyboardbutton_background" btn_secondTitle:@"财富排行" btn_secondImage:@"microphone@2x" btn_thirdTitle:@"竞猜历史" btn_thirdImage:@"info"];
    toolBar.backgroundColor = [UIColor whiteColor];
    [self addSubview:toolBar];
    self.toolBar = toolBar;
}
- (void)_addView {

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.toolBar.frame), kScreenWidth, 30)];
    [self addSubview:view];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    lable1.font = [UIFont systemFontOfSize:13];
    lable1.text = @"可用M币：0";
    lable1.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lable1];
    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 60, 30)];
    lable2.font = [UIFont systemFontOfSize:13];
    lable2.text = @"下注：0";
    lable2.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lable2];
    
    
    self.view = view;
    

//    UILabel *lable3 = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 60, 20)];
//    lable3.font = [UIFont systemFontOfSize:13];
//    UILabel *lable4 = [[UILabel alloc] initWithFrame:CGRectMake(220, 0, 60, 20)];
//    lable4.font = [UIFont systemFontOfSize:13];
}
- (void)addUI:(NSNotification *)noti {
    NSDictionary *mesageDic = noti.userInfo;

    if (!mesageDic[@"message"]) {
        [self _addMoreView];
        self.frame = CGRectMake(0, 0, kScreenWidth, 100);
        return;
    };
    
    
    
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
    
    self.moreView = moreView;
    [self addSubview:moreView];
}

@end
