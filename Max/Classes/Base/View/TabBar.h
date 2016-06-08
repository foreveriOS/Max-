//
//  TabBar.h
//  网易彩票
//
//  Created by mac on 16/4/2.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;

@protocol TabBarDelegate <NSObject>

@optional
- (void)tabBar:(TabBar *)tabBar didSelecteItemFrom:(int)from to:(int)to;

@end

@interface TabBar : UIView

@property (strong, nonatomic) id<TabBarDelegate> delegate;

- (void)addBarButttonItemWithName:(NSString *)name selecteName:(NSString *)selecteName itemName:(NSString *)itemName;

@end
