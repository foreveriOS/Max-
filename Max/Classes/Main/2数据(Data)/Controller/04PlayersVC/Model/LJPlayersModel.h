//
//  LJPlayersModel.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//
/*http://api.maxjia.com:80/api/league/get_league_schedule/?&lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464486658&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&leagueid=4478&start_time=0
 
 "result":{
 "category_list":[
 {
 "duration":2813,
 "match_id":2300210053,
 "radiant_win":true,
 "start_time":1460864347,
 "team1_bg":"FFFFFF",
 "team1_id":2811514,
 "team1_image_url":"http://cloud-3.steamusercontent.com/ugc/273966218655337708/1E853F4419A45239886A0AA06473080F7A5ED98C/",
 "team1_name":"TI",
 "team2_bg":"FFFFFF",
 "team2_id":2814383,
 "team2_image_url":"http://cloud-3.steamusercontent.com/ugc/455236878691200952/234AB0780343E39F15FDBF9AC9956EE2FF0CE44A/",
 "team2_name":"Senpai",
 "type":"past"
 },
 */
#import <Foundation/Foundation.h>

@interface LJPlayersModel : NSObject

@property (nonatomic, copy) NSString *team1_image_url;
@property (nonatomic, copy) NSString *team1_name;
@property (nonatomic, copy) NSString *team1_bg;
@property (nonatomic, copy) NSNumber *team1_id;

@property (nonatomic, copy) NSString *team2_image_url;
@property (nonatomic, copy) NSString *team2_name;
@property (nonatomic, copy) NSString *team2_bg;
@property (nonatomic, copy) NSNumber *team2_id;

@property (nonatomic, copy) NSNumber *start_time;
@property (nonatomic, copy) NSNumber *duration;
@property (nonatomic, copy) NSNumber *match_id;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) BOOL radiant_win;



@end
