//
//  PlayersViewController.m
//  Max
//
//  Created by MJ on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "PlayersViewController.h"

@interface PlayersViewController ()
@property (strong, nonatomic) UIWebView *webView;
@end

@implementation PlayersViewController
/*http://news.maxjia.com/maxnews/app/detail/dota2/13763*/
- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webText]]];
}



@end
