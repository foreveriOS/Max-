//
//  LJMatchTeamModel.h
//  Max
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//
/* "team1_info":{
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
 }*/
#import <Foundation/Foundation.h>

@interface LJMatchTeamModel : NSObject
@property (nonatomic, copy) NSString *eitem_gain_percent; //1. 赔率


@property (nonatomic, copy) NSString *eitem_user_percent; //2.
@property (nonatomic, copy) NSString *mcoin_gain_percent; //3.
@property (nonatomic, copy) NSString *mcoin_user_percent; //4.
@end
