//
//  MoreLeargusModel.h
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//
/*"result":[
 Object{...},
 {
 "image_url":"http://cdn.dota2.com.cn/apps/570/icons/econ/leagues/subscriptions_prodota_cup_by_azubutv.cfd5a89c542ceca0182397d39442b8567e3d6192.png",
 "last_match_time":1464361634,
 "leagueid":3511,
 "match_count":485,
 "name":"“Azubu.tv”杯ProDotA联赛",
 "tier_desc":"专业组"
 },*/
#import <Foundation/Foundation.h>

@interface MoreLeargusModel : NSObject
//@property (nonatomic, assign) CGFloat w;
//@property (nonatomic, assign) CGFloat h;

@property (nonatomic, copy) NSString *name;//title
@property (nonatomic, copy) NSString *image_url;//imageURL
@property (nonatomic, copy) NSString *tier_desc;//描述
@property (nonatomic, copy) NSNumber *last_match_time; //时间
@property (nonatomic, copy) NSNumber *match_count; //场次
@property (nonatomic, copy) NSNumber *leagueid; //leagueid
@end
