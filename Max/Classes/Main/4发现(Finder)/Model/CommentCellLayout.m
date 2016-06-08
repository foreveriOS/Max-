//
//  CommentCellLayout.m
//  Max
//
//  Created by clip on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "CommentCellLayout.h"

@implementation CommentCellLayout

- (NSMutableArray *)imageFrameArray {
    
    if (_imageFrameArray == nil) {
        
        
        _imageFrameArray = [NSMutableArray array];
    }
    
    return _imageFrameArray;
    
}

- (void)setCommentModel:(CommentModel *)commentModel {
    
    _commentModel = commentModel;
    
    self.cellHeight += kCellOriginHeight;
    
    if (![_commentModel.desc isEqualToString:@""]) {
        
        
        NSDictionary *attributes = @{
                                     NSFontAttributeName : [UIFont systemFontOfSize:13]
                                     };
        
        CGRect textRect = [_commentModel.desc boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        
        self.commentDescFrame = CGRectMake(kSpace, kCellOriginHeight, kScreenWidth - 20, CGRectGetHeight(textRect));
        
        self.cellHeight += CGRectGetHeight(textRect) + kSpace;
        
        if (_commentModel.imgsArray.count != 0) {
            
            self.cellHeight += [self weiboMultiImagesFrame:self.commentDescFrame picUrls:_commentModel.imgsArray];
            
            
            
        }
        
    }else {
        
        self.cellHeight += [self weiboMultiImagesFrame:CGRectMake(kSpace, kCellOriginHeight, kScreenWidth - 20, 0) picUrls:_commentModel.imgsArray] + kSpace;
        
        
    }
    
    
    
    for (NSInteger i = self.imageFrameArray.count; i < kImageCount; i ++) {
        
        [self.imageFrameArray addObject:[NSValue valueWithCGRect:CGRectZero]];
        
        
        
    }
    
}



#pragma mark - 确定多图的frame

- (CGFloat)weiboMultiImagesFrame:(CGRect)imageRectFrame picUrls:(NSArray *)urls {
    
    CGFloat imageX = CGRectGetMinX(imageRectFrame);
    CGFloat imageY = CGRectGetMaxY(imageRectFrame) + kSpace;
    
    CGFloat imageSize = (CGRectGetWidth(imageRectFrame) - 2 * kImageGap) / kImageCountPerLine;
    
    NSInteger row = 0;
    NSInteger column = 0;
    
    for (NSInteger i = 0; i < urls.count; i ++) {
        
        row = i / kImageCountPerLine;
        column = i % kImageCountPerLine;
        
        CGRect imageFrame = CGRectMake(imageX + column * (imageSize + kImageGap), imageY + row * (imageSize + kImageGap), imageSize, imageSize);
        
        [self.imageFrameArray addObject:[NSValue valueWithCGRect:imageFrame]];
    }
    
    NSInteger line = (urls.count + kImageCountPerLine - 1) / kImageCountPerLine;
    NSInteger imageGap = MAX(line - 1, 0);
    
    NSInteger imageTextGap = MIN(1, MAX(0, line));
    
    CGFloat height = line * imageSize + imageGap * kImageGap + imageTextGap * kSpace;
    
    return height;
    
}



@end
