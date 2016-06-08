//
//  ReplyLayout.h
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsReplyModel.h"

@interface ReplyLayout : NSObject

@property (strong, nonatomic) NewsReplyModel *replyModel;

@property (assign, nonatomic) CGFloat cellHeight;

@property (assign, nonatomic) CGRect textLabelFrame;

@end
