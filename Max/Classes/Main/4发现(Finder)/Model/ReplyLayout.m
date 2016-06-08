//
//  ReplyLayout.m
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "ReplyLayout.h"

@implementation ReplyLayout

- (void)setReplyModel:(NewsReplyModel *)replyModel {
    
    _replyModel = replyModel;
    
    NSString *userName = _replyModel.userName;
    
    NSString *replyUserName = _replyModel.replyUserName;
    
    NSString *text = _replyModel.text;
    
    NSString *str = [NSString stringWithFormat:@"%@ 回复 %@: %@ %@",userName,replyUserName,text,_replyModel.create_at];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:11]
                                 };
    
    CGRect textRect = [str boundingRectWithSize:CGSizeMake(kScreenWidth - 80, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    self.cellHeight += CGRectGetHeight(textRect) + 6;
    
   
    
    self.textLabelFrame = CGRectMake(3, 3, kScreenWidth - 80, CGRectGetHeight(textRect));
    

}

@end
