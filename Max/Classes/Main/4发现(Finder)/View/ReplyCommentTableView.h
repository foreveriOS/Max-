//
//  ReplyCommentTableView.h
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyCommentTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *replyCommentArray;

@end
