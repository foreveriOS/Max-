//
//  FinderViewController.h
//  Max+
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinderViewController : UIViewController

- (NSArray *)transportDicForModel:(NSDictionary *)response;

- (NSArray *)transportCommentDic:(NSDictionary *)response;
@end
