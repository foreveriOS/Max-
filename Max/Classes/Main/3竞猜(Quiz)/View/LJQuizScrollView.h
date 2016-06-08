//
//  LJQuizScrollView.h
//  Max
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJQuizLeftTableView.h"
#import "LJQuizRightTableView.h"
//@class LJQuizLeftTableView;
//@class LJQuizRightTableView;
@interface LJQuizScrollView : UIScrollView
@property (nonatomic, strong) NSArray *leftDatas;
@property (nonatomic, strong) NSArray *rightDatas;
@property (nonatomic, strong) NSArray *matchesDatas;

@property (nonatomic, strong) LJQuizLeftTableView *quizLeftTableView;
@property (nonatomic, strong) LJQuizRightTableView *quizRightTableView;

@end
