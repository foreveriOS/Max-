//
//  NewsViewController.m
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsViewController.h"
#import "HeadView.h"
#import "NewsScrollView.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.title = @"Max+ 新闻";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:15],
                                 
                                 NSForegroundColorAttributeName : [UIColor whiteColor]
                                 };
    
    self.navigationController.navigationBar.titleTextAttributes = attributes;
    
    self.navigationController.navigationBar.translucent = NO;

    [self createHeadView];
    
    [self createMainView];
}

- (void)createHeadView {
    
    
    
    
    HeadView *headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenHeight, 30) firstButtonName:@"新闻" lastButtonName:@"评论"];
    
    headView.backgroundColor = [UIColor colorWithRed:48 / 255.0 green:55 / 255.0 blue:73 / 255.0 alpha:1];
    
    [self.view addSubview:headView];
    
    
}

- (void)createMainView {
    
    
    NewsScrollView *scrollView = [[NewsScrollView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight - 94)];
    
    scrollView.newsid = self.newsid;
    
    scrollView.newsUrl = self.newsUrl;
    
    [self.view addSubview:scrollView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
