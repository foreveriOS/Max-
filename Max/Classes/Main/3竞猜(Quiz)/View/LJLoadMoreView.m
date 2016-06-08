//
//  LJLoadMoreView.m
//  Max
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJLoadMoreView.h"

@implementation LJLoadMoreView

//- (instancetype)initWithFrame:(CGRect)frame {
//    
//    if (self = [super initWithFrame:frame]) {
//        [self _addSubview];
//    }
//    return self;
//}
//- (void)_addSubview {
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - self.frame.size.height*1.5, self.frame.size.height)];
//    label.textAlignment = NSTextAlignmentRight;
//    label.font = [UIFont systemFontOfSize:12];
//    label.text = @"加载全部";
//    [self addSubview:label];
//    
//    UIImageView *iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow@2x"]];
//    iconImage.frame = CGRectMake(CGRectGetMaxX(label.frame) + 5, self.frame.size.height*0.25, self.frame.size.height*0.5, self.frame.size.height*0.5);
//    iconImage.contentMode = UIViewContentModeScaleAspectFit;
//    [self addSubview:iconImage];
//}





- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)titleName image:(NSString *)imageName {
    
    if (self = [super initWithFrame:frame]) {
        [self _addSubviewTitle:titleName image:imageName];
    }
    return self;
}
- (void)_addSubviewTitle:(NSString *)titleName image:(NSString *)imageName {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - self.frame.size.height*1.5, self.frame.size.height)];
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont systemFontOfSize:12];
    label.text = titleName;
    [self addSubview:label];
    
    UIImageView *iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    iconImage.frame = CGRectMake(CGRectGetMaxX(label.frame) + 5, self.frame.size.height*0.25, self.frame.size.height*0.5, self.frame.size.height*0.5);
    iconImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:iconImage];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//#warning nslog... 
    NSLog(@"加载全部");
}
@end
