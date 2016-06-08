//
//  CommentTableViewCell.h
//  Max
//
//  Created by clip on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentCellLayout.h"
#import "WXPhotoBrowser.h"

@interface CommentTableViewCell : UITableViewCell<PhotoBrowerDelegate>

@property (strong, nonatomic) CommentCellLayout *cellLayout;

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) NSMutableArray *imageViewArray;

@end
