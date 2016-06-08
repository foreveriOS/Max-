//
//  LJQuizLeftHeaderView.h
//  Max
//
//  Created by MJ on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>


@class QuizModel;
@interface LJQuizLeftHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong) QuizModel *quizModels;
+ (instancetype)headerWithTableView:(UITableView *)tableView;
@end
