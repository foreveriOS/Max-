//
//  QuizModel.h
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//
/*  竞猜页面：
             http://q.maxjia.com:80/api/bets/get_match_list_v2/3/?lang=zh-cn&os_type=iOS&os_version=9.3.1&_time=1464146903&version=3.3.4&device_id=5E78C9DF-87A4-4BFE-8CD0-C897DA370216&game_type=dota2
     {
         "msg":"",
             "result":{
                     "category_list":Array[39],

                 "faq_red_spot":1,
                 "max_store_red_spot":1,
                 "message":"5月24日 10点将根据Steam 市场价更新饰品估价",
                 "time":37,
                 "user_verified":0
             },
         "status":"ok",
         "version":"1.0"
     }
 
         message ：headView的title文本
         result（key）----> category_list ：values里面每个字典是一个组，一个组包含所有cell
 */

/* category_list：所有section信息
 "category_list":[
     {
         "category_type":"dota",
         "end_bid_time":"1464246000.0000",
         "league_img_url":"http://cdn.maxjia.com/image/default_match_bg.png",
         "match_id":5851,

             "matches":Array[10],

         "progress":"bidding",
         "progress_desc":"竞猜中",
         "sort_order":0,

             "team1_info":Object{...},
         "team1_score":0,
             "team2_info":Object{...},

         "team2_score":0,
         "title":"The Summit 5[决赛] BO5"
     },
 */

/*matches：section内部所有的cell信息
 "matches":[
     {
         "end_bid_time":"1464246000.0000",
         "match_id":5847,
         "progress":"bidding",
         "progress_desc":"竞猜中",
         "sort_order":0,
         "sub_title":"猜胜负",
             "team1_info":{
                 "eitem_gain_percent":"0.7693",
                 "eitem_user_percent":"49.5746",
                 "mcoin_gain_percent":"0.8370",
                 "mcoin_user_percent":"43.7430"
             },
             "team2_info":{
                 "eitem_gain_percent":"1.1731",
                 "eitem_user_percent":"50.4254",
                 "mcoin_gain_percent":"1.0783",
                 "mcoin_user_percent":"56.2570"
             }
     },
     Object{...},
 */

/*team1_info: cell左边信息
     "team1_info":{
         "bg_color_type":"transparent",
         "game_team_id":1836806,
             "logo":{
                 "url":"http://cloud-3.steamusercontent.com/ugc/388797004877110981/04CFB18E96A44F760D6980778ECABA0DAF7313EE/"
             },
         "mmr":1941,
         "rank":7,
         "tag":"Wings",
         "team_id":4,
         "win_rate":"60.0000"
     },
*/

/*team2_info：cell右边信息
     "team2_info":{
         "bg_color_type":"transparent",
         "game_team_id":2777247,
             "logo":{
                 "url":"http://cdn.maxjia.com/@/dota2/team/VG.R.png"
             },
         "mmr":1900,
         "rank":14,
         "tag":"VG.R",
         "team_id":107,
         "win_rate":"70.2128"
     },
 */



#import <Foundation/Foundation.h>

@class LJTeam1_infoModel;
@class LJMatchModel;
@interface QuizModel : NSObject

@property (nonatomic, copy) NSString *title; //1. title
@property (nonatomic, copy) NSString *end_bid_time; //2. 结束时间
@property (nonatomic, copy) NSString *progress_desc; //3. 进度描述

@property (nonatomic, strong) NSDictionary *team1_info;
@property (nonatomic, strong) NSDictionary *team2_info;
@property (nonatomic, strong) NSArray *matches; //cell的model

@property (nonatomic, copy) NSString *league_img_url; //联盟iconURL
@property (nonatomic, copy) NSString *category_type; //类型
@property (nonatomic, copy) NSNumber *match_id; //匹配id
@property (nonatomic, copy) NSString *progress; //进步


@end
