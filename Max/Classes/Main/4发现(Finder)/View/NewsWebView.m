//
//  NewsWebView.m
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsWebView.h"

@implementation NewsWebView

- (void)setNewsUrl:(NSString *)newsUrl {
    
    _newsUrl = newsUrl;
    
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_newsUrl]]];
    
    
}

@end
