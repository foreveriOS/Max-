//
//  LJPlayersHeroModel.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//
/* http://api.maxjia.com:80/api/league/get_league_hero_stats/?&lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464486781&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&league_id=4478
 
 "result":[
 {
 "ban_count":2,
 "hero_info":{
 "DOTA_ATTRIBUTE_AGILITY":true,
 "hero_id":20,
 "hero_name":"复仇之魂",
 "img_name":"vengefulspirit"
 },
 "kda":"2.2481",
 "match_count":27,
 "win_count":14,
 "win_rate":"51.8519"
 },
 */
#import <Foundation/Foundation.h>

@interface LJPlayersHeroModel : NSObject

@property (nonatomic, copy) NSString *img_name; //图片名
@property (nonatomic, copy) NSString *hero_name;//英雄名
@property (nonatomic, copy) NSString *kda; //kda
@property (nonatomic, copy) NSString *win_rate;//胜率
@property (nonatomic, copy) NSNumber *ban_count; //禁止数
@property (nonatomic, copy) NSNumber *match_count; //匹配数


@end
