//
//  CommentTableView.h
//  Max
//
//  Created by clip on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *commentLayoutArray;;


@end
