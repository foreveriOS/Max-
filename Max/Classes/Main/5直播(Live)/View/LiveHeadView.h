//
//  LiveHeadView.h
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveHeadView : UIView

{
    
    UIImageView *_selectView;
}

- (instancetype)initWithFrame:(CGRect)frame firstButtonName:(NSString *)firstName lastButtonName:(NSString *)lastName;

@end
