//
//  LJMatchModel.h
//  Max
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//
/* "matches":[
 {
 "end_bid_time":"1464764400.0000",
 "match_id":6383,
 "progress":"bidding",
 "progress_desc":"竞猜中",
 "sort_order":0,
 "sub_title":"猜胜负",
 "team1_info":{
 "eitem_gain_percent":"0.5245",
 "eitem_user_percent":"71.8350",
 "mcoin_gain_percent":"0.6433",
 "mcoin_user_percent":"59.0012"
 },
 "team2_info":{
 "eitem_gain_percent":"1.7205",
 "eitem_user_percent":"28.1650",
 "mcoin_gain_percent":"1.4029",
 "mcoin_user_percent":"40.9988"
 }
 },*/
#import <Foundation/Foundation.h>

@class LJMatchTeamModel;
@interface LJMatchModel : NSObject
@property (nonatomic, copy) NSString *sub_title; //1. title
@property (nonatomic, copy) NSString *end_bid_time; //2. 结束时间
@property (nonatomic, strong) NSDictionary *team1_info; //
@property (nonatomic, strong) NSDictionary *team2_info; //

@property (nonatomic, copy) NSString *progress; //3. 进度描述
@property (nonatomic, copy) NSString *progress_desc;
@property (nonatomic, copy) NSNumber *match_id; //匹配id
@property (nonatomic, copy) NSString *sort_order; //进步

@end
