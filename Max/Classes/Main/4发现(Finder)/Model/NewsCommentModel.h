//
//  NewsCommentModel.h
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NewsCommentModel : NSObject

@property (copy, nonatomic) NSString *avartar;

@property (copy, nonatomic) NSString *userName;

@property (copy, nonatomic) NSString *create_at;

@property (copy, nonatomic) NSString *text;

@property (strong, nonatomic) NSArray *modelArray;
@end
