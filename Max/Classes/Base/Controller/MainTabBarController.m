//
//  MainTabBarController.m
//  网易彩票
//
//  Created by mac on 16/4/1.
//  Copyright © 2016年 LJ. All rights reserved.
//
#import "TabBar.h"
#import "BarButtonItem.h"

#import "MainTabBarController.h"

@interface MainTabBarController () <TabBarDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //0.0 tabBar的子控制器加载
    [self _createViewControllers];

    //1.0 自定义的tabbar
    [self _createTabBar];
}
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}
- (void)_createTabBar {

    TabBar *tabBar = [[TabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;  //注意使用frame没用，因为设置bounds才会换成系统的tabBar
    tabBar.delegate = self;
//        tabBar.backgroundColor = [UIColor grayColor];
//    [tabBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ToolbarBG"]]];
    [self.tabBar addSubview:tabBar];


    //2. 创建item
    NSArray *itemNames = @[@"我", @"数据", @"竞猜", @"发现", @"直播"];

    NSArray *itemImages = @[@"icon_face_normal", @"icon_data_normal",  @"icon_guess_normal", @"icon_find_normal", @"icon_live_normal"];

    NSArray *itemSelectedImages = @[@"icon_face_selected", @"icon_data_selected",  @"icon_guess_selected", @"icon_find_selected", @"icon_live_selected"];

    for (int i = 0; i < self.viewControllers.count; i ++) {

        NSString *name = [NSString stringWithFormat:@"%@", itemImages[i]];
        NSString *selectName = [NSString stringWithFormat:@"%@", itemSelectedImages[i]];
        [tabBar addBarButttonItemWithName:name selecteName:selectName itemName:itemNames[i]];

    }

}

#pragma mark - tabbar的代理方法
- (void)tabBar:(TabBar *)tabBar didSelecteItemFrom:(int)from to:(int)to {
        //选中最新的控制器
    self.selectedIndex = to;
}

/**
 *     0.0 从自定义storyboard加载控制器
 */
- (void)_createViewControllers
{
    //先拿到所有的storyboard
    UIStoryboard *binding = [UIStoryboard storyboardWithName:@"Binding" bundle:nil];
    UIStoryboard *data = [UIStoryboard storyboardWithName:@"Data" bundle:nil];
    UIStoryboard *quiz = [UIStoryboard storyboardWithName:@"Quiz" bundle:nil];
    UIStoryboard *finder = [UIStoryboard storyboardWithName:@"Finder" bundle:nil];
    UIStoryboard *live = [UIStoryboard storyboardWithName:@"Live" bundle:nil];

    //    拿到所有的viewctrl
    NSArray * viewCtrls = @[[binding instantiateInitialViewController],
                            [data instantiateInitialViewController],
                            [quiz instantiateInitialViewController],
                            [finder instantiateInitialViewController],
                            [live instantiateInitialViewController]
                            ];
    //设置给self
    self.viewControllers = viewCtrls;
}


@end
