//
//  NewsCommentLayout.h
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsCommentModel.h"
#import "NewsReplyModel.h"

#define kCellOriginHeight 50
#define kSpace 10

@interface NewsCommentLayout : NSObject

@property (strong, nonatomic) NewsCommentModel *commentModel;

@property (assign, nonatomic) CGFloat cellHeight;

@property (assign, nonatomic) CGRect textLabelFrame;



@end
