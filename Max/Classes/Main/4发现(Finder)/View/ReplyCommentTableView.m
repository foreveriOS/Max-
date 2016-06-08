//
//  ReplyCommentTableView.m
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "ReplyCommentTableView.h"
#import "ReplyCommentCell.h"

@implementation ReplyCommentTableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        
        self.dataSource = self;
        
        self.replyCommentArray = [NSArray array];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.userInteractionEnabled = NO;
        
    }
    
    return self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    
    return self.replyCommentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ReplyCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reply"];
    
    if (cell == nil) {
    
        cell = [[ReplyCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reply"];
    }
    
    cell.replyLayout = self.replyCommentArray[indexPath.row];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReplyLayout *layout = self.replyCommentArray[indexPath.row];
    
    return layout.cellHeight;
}



@end
