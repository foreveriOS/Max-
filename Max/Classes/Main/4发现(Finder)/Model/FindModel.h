//
//  FindModel.h
//  Max
//
//  Created by clip on 16/5/27.
//  Copyright © 2016年 LYH. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface FindModel : NSObject

@property (assign, nonatomic) NSNumber *click;

@property (copy, nonatomic) NSString *date;

@property (assign, nonatomic) NSNumber *img_type;

@property (copy, nonatomic) NSString *imageUrl;

@property (copy, nonatomic) NSString *newsURL;

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *newsid;

@property (assign, nonatomic) NSNumber *content_type;
@end
