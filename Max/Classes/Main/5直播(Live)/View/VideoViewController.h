//
//  VideoViewController.h
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController

@property (atomic, strong) NSURL *url;

@property (copy, nonatomic) NSString *title;

@end
