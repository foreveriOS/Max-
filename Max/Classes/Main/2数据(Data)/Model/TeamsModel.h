//
//  TeamsModel.h
//  Max
//
//  Created by MJ on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//
/* 02---热门战队、玩家cellectionView
 "teams":[
 {
 "bg":"http://cdn.maxjia.com/team_bgs/blue_1.png",
 "image_url":"http://cloud-3.steamusercontent.com/ugc/451783905032671206/4CBD3B9B03D9515A20D471437EF0FEB81363C198/",
 "mmr":2149,
 "rank":1,
 "team_id":2163,
 "team_name":"Liquid",
 "win_rate":"60.0000"
 },

 Object{...},
 Object{...},
 Object{...},
 Object{...}
 ],
 */

#import <Foundation/Foundation.h>

@interface TeamsModel : NSObject
/**
 *  teams 战队
 */
@property (nonatomic, copy) NSString *bg;  //icon背景url
@property (nonatomic, copy) NSString *image_url; //iconURL
@property (nonatomic, copy) NSString *win_rate; //胜率
@property (nonatomic, copy) NSString *team_name;  //团队titile
@property (nonatomic, copy) NSNumber *team_id; //团队id
@property (nonatomic, copy) NSNumber *rank; //排名
@property (nonatomic, copy) NSNumber *mmr; //MMR


@end
