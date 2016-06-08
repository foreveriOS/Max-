//
//  ReplyCommentCell.m
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "ReplyCommentCell.h"

@interface ReplyCommentCell ()

@property (strong, nonatomic) UILabel *messageLabel;

@property (strong, nonatomic) UILabel *dateLabel;

@end

@implementation ReplyCommentCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

- (UILabel *)messageLabel {
    
    if (_messageLabel == nil) {
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _messageLabel.font = [UIFont systemFontOfSize:11];
        
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        
        _messageLabel.numberOfLines = 0;
        
        [self.contentView addSubview:_messageLabel];
    }
    
    return _messageLabel;
    
}



- (void)setReplyLayout:(ReplyLayout *)replyLayout {
    
    
    self.contentView.backgroundColor = [UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1];
    
    _replyLayout = replyLayout;
    
    NSString *userName = _replyLayout.replyModel.userName;
    
    NSString *replyUserName = _replyLayout.replyModel.replyUserName;
    
    NSString *text = _replyLayout.replyModel.text;
    
    NSString *str = [NSString stringWithFormat:@"%@ 回复 %@: %@  %@",userName,replyUserName,text,_replyLayout.replyModel.create_at];
    
    
    self.messageLabel.frame = _replyLayout.textLabelFrame;
    
    self.messageLabel.text = str;
    
    
    
}

@end
