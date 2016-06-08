//
//  NewsCommentLayout.m
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsCommentLayout.h"
#import "ReplyLayout.h"

@implementation NewsCommentLayout

- (void)setCommentModel:(NewsCommentModel *)commentModel {
    
    _commentModel = commentModel;
    
    self.cellHeight += kCellOriginHeight;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:12]
                                 };
    
    CGRect textRect = [_commentModel.text boundingRectWithSize:CGSizeMake(kScreenWidth - 70, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    self.textLabelFrame = CGRectMake(0, kCellOriginHeight, kScreenWidth - 70, CGRectGetHeight(textRect));
    
    self.cellHeight += CGRectGetHeight(textRect) + kSpace;
    
    if (_commentModel.modelArray.count > 0) {
        
        CGFloat tableViewHeight = 0;
        
        for (ReplyLayout *layout in _commentModel.modelArray) {
            
            tableViewHeight += layout.cellHeight;
            
            
            
        }
        
        
        self.cellHeight += tableViewHeight;
        
    }
    
    
}

@end
