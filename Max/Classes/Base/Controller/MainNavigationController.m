//
//  MainNavigationController.m
//  网易彩票
//
//  Created by mac on 16/4/2.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationBar];

    [self customPopGesture];
}

- (void)setupNavigationBar {
    
    //导航栏标题大小设置
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:17],
                                 
                                 NSForegroundColorAttributeName : [UIColor whiteColor]
                                 };
    
    self.navigationBar.titleTextAttributes = attributes;
    
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];

    //1. 设置导航栏
    //1.1 navigationBar背景图片设置
    UINavigationBar *navigationBar = [UINavigationBar appearance]; //拿到状态栏的模本
    //ios7 和 ios6的适配，宏定义解决
    NSString *navImage = @"camera_bg_iphone5";
    if (iOS7) {             //至少是ios7
        navImage = @"camera_bg_iphone5";

    }

    UIImage *image = [UIImage resizableImage:navImage];
    [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    //1.2 导航栏title标题颜色和字体大小
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    mDic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    mDic[NSForegroundColorAttributeName] = [UIColor whiteColor];

    [navigationBar setTitleTextAttributes:mDic];

    //2. 设置BarButtonItem的主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];

    NSMutableDictionary *itemDic = [NSMutableDictionary dictionary];
    itemDic[NSFontAttributeName] = [UIFont systemFontOfSize:14]; //文字大小
    itemDic[NSForegroundColorAttributeName] = [UIColor whiteColor]; //文字颜色

    [item setTitleTextAttributes:itemDic forState:UIControlStateNormal];





    //4. 设置按钮背景 back_arrow@2x（返回button的image）
    //    if (!iOS7) {
    //
    //        [item setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //        [item setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    //
    //        //设置返回按钮背景图片
    //        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    //    }

}

/**
 *  3. 重新父类的push方法，push的时候 这儿实现隐藏标签栏
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    //隐藏底部标签栏
    viewController.hidesBottomBarWhenPushed = YES;

    //自定义导航栏的left返回按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 10, 44);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    viewController.navigationItem.leftBarButtonItem = item;
    

    
   

    [super pushViewController:viewController animated:YES];
}

- (void)pop {

    [self popViewControllerAnimated:YES];
}



/**
 *  利用Runtime机制 给导航栏 pop 添加 pan gesture
 */
-(void)customPopGesture
{
    //关闭 UINavigationController pop 默认的交互手势
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    //NSLog(@"%@", gesture);
    
    //添加一个新的pan手势到 gesture.view 里面
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
    popRecognizer.delegate = self;
    popRecognizer.maximumNumberOfTouches = 1;
    [gesture.view addGestureRecognizer:popRecognizer];
    
    //获取手势唯一的接收对象（打印gesture）
    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
    id gestureRecognizerTarget = [_targets firstObject];
    //获取target
    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
    //获取action
    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
    //设置pan手势事件响应
    [popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
}

//有两个条件不允许手势执行，1、当前控制器为根控制器；2、push、pop动画正在执行
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return self.viewControllers.count > 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

@end
