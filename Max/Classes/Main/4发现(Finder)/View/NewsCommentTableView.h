//
//  NewsCommentTableView.h
//  Max
//
//  Created by clip on 16/5/28.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCommentTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *commentModelArray;

@property (copy, nonatomic) NSString *newsid;

@end
