//
//  LJLeargusRightTableView.h
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYHSelectedOtherBock)();
@interface LJLeargusRightTableView : UITableView
@property (nonatomic, strong) NSMutableArray *rightHeroDatas;
@property (nonatomic, strong) NSMutableArray *rightPlayerDatas;
@property (nonatomic, copy) LYHSelectedOtherBock rightPlayersDatasBlock;
@property (nonatomic, copy) LYHSelectedOtherBock rightHeroBlock;
@end
