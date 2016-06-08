//
//  SecondOrThirdSectionCell.m
//  Max
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "SecondOrThirdSectionCell.h"
#import "LJSecondScrollView.h"

@interface SecondOrThirdSectionCell ()

@property (weak, nonatomic) IBOutlet LJSecondScrollView *scrollView;


@end
@implementation SecondOrThirdSectionCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"SecondCellID";

    SecondOrThirdSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *arrCell = [[NSBundle mainBundle] loadNibNamed:@"SecondCell" owner:nil options:nil];
        cell = [arrCell lastObject];

    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1. 创建scrollView
        [self _addScrollView];

    }
    return self;
}

- (void)awakeFromNib {

    [self _addScrollView];
}
- (void)setLeagues:(NSMutableArray *)leagues {

    _leagues = leagues;

    self.scrollView.leagues = leagues;
}
- (void)_addScrollView {

    self.scrollView.contentSize = CGSizeMake(kScreenWidth*2 + (kScreenWidth/2-50)/2 + 20, kScreenWidth/2-50);
//    self.scrollView.contentInset = ;
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    self.scrollView.showsHorizontalScrollIndicator = NO; // 水平方向是否显示滑动条 ,默认是显示的
    self.scrollView.showsVerticalScrollIndicator  = NO; //竖直方向是否显示滚动条
    self.scrollView.bounces = NO; //反弹效果关闭

    self.scrollView.leargusBlock = ^(NSString *name){

        if (self.leargusBlock) {
            self.leargusBlock(name);
        }
    };

    self.scrollView.moreLeargusBlock = ^(){

        if (self.moreLeargusBlock) {
            self.moreLeargusBlock();
        }
    };
}
@end
