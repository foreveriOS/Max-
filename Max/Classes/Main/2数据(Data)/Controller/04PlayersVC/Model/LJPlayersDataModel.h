//
//  LJPlayersDataModel.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//
/* http://api.maxjia.com:80/api/league/get_league_player_stats/?&lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464486782&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&league_id=4478

 "result":[
 {
 "a":65,
 "d":16,
 "image_url":"http://cdn.dota2.com.cn/steamcommunity/public/images/avatars/https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/22/22d829ddccfbf514937d9b10865ef5b468a6aed9_full.jpg",
 "is_verified":1,
 "k":48,
 "kda":"7.0625",
 "personaname":"ddz",
 "steam_id":104963314
 },
*/
#import <Foundation/Foundation.h>

@interface LJPlayersDataModel : NSObject  
@property (nonatomic, copy) NSString *personaname;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString *kda;
@property (nonatomic, copy) NSNumber *k; //击杀
@property (nonatomic, copy) NSNumber *d; //死亡
@property (nonatomic, copy) NSNumber *a; //助攻
@property (nonatomic, copy) NSNumber *is_verified;
@end
