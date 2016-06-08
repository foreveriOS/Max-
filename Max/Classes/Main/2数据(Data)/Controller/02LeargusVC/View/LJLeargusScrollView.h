//
//  LJLeargusScrollView.h
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJLeargusLeftTableView;
@class LJLeargusRightTableView;
typedef void (^LYHSelectedOtherBock)();
@interface LJLeargusScrollView : UIScrollView
@property (nonatomic, strong) NSMutableArray *leafDatas;   
@property (nonatomic, strong) NSMutableArray *rightHeroDatas;
@property (nonatomic, strong) NSMutableArray *rightPlayerDatas;
@property (nonatomic, strong) LJLeargusLeftTableView *leftTableView;
@property (nonatomic, strong) LJLeargusRightTableView *rightTableView;
@property (nonatomic, copy) LYHSelectedOtherBock rightPlayersDatasBlock;
@property (nonatomic, copy) LYHSelectedOtherBock rightHeroBlock;

@end
