//
//  CommentModel.h
//  Max
//
//  Created by clip on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property (copy, nonatomic) NSString *desc; //文本内容

@property (strong, nonatomic) NSArray *imgsArray; //大图数组

@property (strong, nonatomic) NSArray *thumbsArray; //小图数组

@property (copy, nonatomic) NSString *title; //标题

@property (copy, nonatomic) NSString *avartar; //用户头像

@property (copy, nonatomic) NSString *userName; //用户名

@property (copy, nonatomic) NSString *create_at;  //通过时间戳相减

@property (assign, nonatomic) NSNumber *linkid;

@end
