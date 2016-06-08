//
//  LJTeam1_infoModel.h
//  Max
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//
/*   "team1_info":{
 "bg_color_type":"transparent",
 "game_team_id":4,
 "logo":{
 "url":"http://cdn.maxjia.com/ti5/teams/ehome.png"
 },
 "mmr":1798,
 "rank":27,
 "tag":"EHOME",
 "team_id":21,
 "win_rate":"61.9048"
 },*/
#import <Foundation/Foundation.h>

@interface LJTeam1_infoModel : NSObject
@property (nonatomic, copy) NSString *url; //1. icon
@property (nonatomic, copy) NSString *tag; //2. title

@property (nonatomic, copy) NSString *bg_color_type; //
@property (nonatomic, copy) NSString *game_team_id; //
@property (nonatomic, copy) NSString *mmr; //
@property (nonatomic, copy) NSString *rank; //
@property (nonatomic, copy) NSString *team_id; //战队id
@property (nonatomic, copy) NSString *win_rate; //胜率
@end
