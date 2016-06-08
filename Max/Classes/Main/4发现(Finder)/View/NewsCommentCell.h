//
//  NewsCommentCell.h
//  Max
//
//  Created by clip on 16/5/30.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCommentLayout.h"


@interface NewsCommentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;




@property (strong, nonatomic) NewsCommentLayout *commentLayout;
@end
