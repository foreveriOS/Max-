//
//  PlayersView.h
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  block传递button
 */
typedef void (^LYHSelectedPlaterBlock)(UIButton *);
@interface PlayersView : UIView
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, copy) LYHSelectedPlaterBlock playerBlock;

@end
