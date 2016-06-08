//
//  ShowDetailsViewController.m
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "ShowDetailsViewController.h"

@interface ShowDetailsViewController ()
@property (strong, nonatomic) UIWebView *webView;
@end

@implementation ShowDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news.maxjia.com/maxnews/app/detail/dota2/13763"]]];
}


@end
