//
//  NewsCommentCell.m
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "NewsCommentCell.h"
#import "ReplyCommentTableView.h"
#import "ReplyLayout.h"


@interface NewsCommentCell ()

@property (strong, nonatomic) UILabel *userTextLabel;

@property (strong, nonatomic) ReplyCommentTableView *replyTabelView;

@end

@implementation NewsCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)userTextLabel {
    
    if (_userTextLabel == nil) {
        
        _userTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _userTextLabel.font = [UIFont systemFontOfSize:12];
        
        _userTextLabel.textAlignment = NSTextAlignmentLeft;
        
        _userTextLabel.numberOfLines = 0;
        
        [self.contentView addSubview:_userTextLabel];
    }
    
    
    return _userTextLabel;
    
    
}



- (void)setCommentLayout:(NewsCommentLayout *)commentLayout {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.userImageView.layer.cornerRadius = 17.5;
    
    self.userImageView.layer.masksToBounds = YES;
    
    _commentLayout = commentLayout;
    
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:_commentLayout.commentModel.avartar]];
    
    self.userNameLabel.text = _commentLayout.commentModel.userName;
    
    self.dateLabel.text = _commentLayout.commentModel.create_at;
    
    CGRect rect = commentLayout.textLabelFrame;
    
    rect.origin.x = self.userNameLabel.left;
    
    self.userTextLabel.frame = rect;
    
    self.userTextLabel.text = _commentLayout.commentModel.text;
    
    NSArray *replyArr = _commentLayout.commentModel.modelArray;
    
   CGFloat tableHeight = 0;
    
    for (ReplyLayout *layout in replyArr) {
        
        tableHeight += layout.cellHeight;
        
        
    }
    
    self.replyTabelView.frame = CGRectZero;
    
    self.replyTabelView = [[ReplyCommentTableView alloc] initWithFrame:CGRectMake(self.userTextLabel.left, self.userTextLabel.bottom + 5, kScreenWidth - 70, tableHeight)];
    
    
    [self.contentView addSubview:self.replyTabelView];
    
    self.replyTabelView.replyCommentArray = _commentLayout.commentModel.modelArray;
    
}


@end
