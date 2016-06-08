//
//  PlayersModel.h
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//
/*03---知名玩家（这儿以五个button排布）
 "players":[
 {
 "image_url":"http://cdn.dota2.com.cn/steamcommunity/public/images/avatars/https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/1d/1d740f155d67b915ac1fabf47cf51b6efab6b204_medium.jpg",
 "is_vip":0,
 "name":"小飞机",
 "steam_id":136563189
 },

 Object{...},
 Object{...},
 Object{...},
 Object{...},
 Object{...}
 ],
 */

#import <Foundation/Foundation.h>

@interface PlayersModel : NSObject
/**
 *  players 游戏者 玩家
 */
@property (nonatomic, copy) NSString *name;  //title
@property (nonatomic, copy) NSString *image_url; //iconURL
@property (nonatomic, copy) NSNumber *steam_id; //精力id
@property (nonatomic, copy) NSNumber *is_vip; //是否是vip


@end
