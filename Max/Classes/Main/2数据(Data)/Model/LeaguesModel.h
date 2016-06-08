//
//  LeaguesModel.h
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//

/*   数据页面：
 http://api.maxjia.com:80/api/league/get_league_index/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146768&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2
 {
 "msg":"",

 "result":{
 "leagues":Array[5],
 "players":Array[6],
 "teams":Array[5]
 },

 "status":"ok",
 "version":"1.0"
 }
 */

//\\\\\\\\\\\\\\\\华丽的分割线/////////////////////////////////////////

/*  01---职业联赛cellectionView
 "leagues":[
 {
 "data_live":0,
 "image_url":"http://cdn.dota2.com.cn/apps/570/icons/econ/leagues/subscriptions_nanyang_championships_season2.e438a0beb96ad09f3bde3507431b0d10eb2bbfff.png",
 "last_match_time":1464150876,
 "league_id":"4660",
 "match_count":47,
 "name":"南洋国际锦标赛第2赛季"
 },

 Object{...},
 Object{...},
 Object{...},
 Object{...}
 ],
 */

#import <Foundation/Foundation.h>

@interface LeaguesModel : NSObject
/**
 *  leagues
 */
@property (nonatomic, copy) NSString *image_url; //iconURL
@property (nonatomic, copy) NSString *name;  //titile
@property (nonatomic, copy) NSString *league_id;  //联盟id
@property (nonatomic, copy) NSNumber *last_match_time; //最近比赛-时间
@property (nonatomic, copy) NSNumber *match_count; //场次


@end
