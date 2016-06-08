//
//  CommentCellLayout.h
//  Max
//
//  Created by clip on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentModel.h"

#define kCellOriginHeight 80
#define kSpace 10
#define kImageGap 5
#define kImageCountPerLine 3
#define kImageCount 9

@interface CommentCellLayout : NSObject

@property (strong, nonatomic) CommentModel *commentModel;

@property (assign, nonatomic) CGRect commentDescFrame;

@property (strong, nonatomic) NSMutableArray *imageFrameArray;

@property (assign, nonatomic) CGFloat cellHeight;

@end
