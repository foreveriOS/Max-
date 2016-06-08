//
//  LiveNormalCell.h
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveModel.h"

@interface LiveNormalCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *liveImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;


@property (weak, nonatomic) IBOutlet UILabel *liveOnlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (strong, nonatomic) LiveModel *liveModel;
@end
