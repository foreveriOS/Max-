//
//  LJLeargusLeftTableView.h
//  Max
//
//  Created by MJ on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LYHSelectedOtherBock)();
@interface LJLeargusLeftTableView : UITableView
@property (nonatomic, strong) NSMutableArray *leafDatas;
@property (nonatomic, copy) LYHSelectedOtherBock rightHeroBlock;
@end
