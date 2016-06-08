//
//  CommentTableViewCell.m
//  Max
//
//  Created by clip on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "CommentTableViewCell.h"

@interface CommentTableViewCell ()

@property (strong, nonatomic) UILabel *descLabel;



@end

@implementation CommentTableViewCell

- (NSMutableArray *)imageViewArray {
    
    
    if (_imageViewArray == nil) {
        
        _imageViewArray = [NSMutableArray array];
        
        for (NSInteger i = 0; i < kImageCount; i ++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            
            imageView.clipsToBounds = YES;
            
            imageView.userInteractionEnabled = YES;
            
            imageView.tag = i;
            
            [_imageViewArray addObject:imageView];
            [self.contentView addSubview:imageView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            
            
            [imageView addGestureRecognizer:tap];
        }
        
        
    }
    
    
    
    return _imageViewArray;
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    
    
    [self ViewController].navigationController.navigationBarHidden = YES;
    
    [self ViewController].tabBarController.tabBar.hidden = YES;
    
    [WXPhotoBrowser showImageInView:[self ViewController].view selectImageIndex:tap.view.tag delegate:self];
    
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(WXPhotoBrowser *)photoBrowser {
    
    
    return self.cellLayout.commentModel.imgsArray.count;
    
}

- (WXPhoto *)photoBrowser:(WXPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    
    
    WXPhoto *photo = [[WXPhoto alloc] init];
    
    photo.srcImageView = self.imageViewArray[index];
    
    NSArray *urls = self.cellLayout.commentModel.imgsArray;
    
    NSString *urlStr = urls[index];
    
    photo.url = [NSURL URLWithString:urlStr];
    

    
    
    return photo;
    
}


- (UILabel *)descLabel {
    
    if (_descLabel == nil) {
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _descLabel.font = [UIFont systemFontOfSize:13];
        
        _descLabel.numberOfLines = 0;
        
        _descLabel.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:_descLabel];
    }
    
    return _descLabel;
    
}

- (void)awakeFromNib {

    _userImageView.layer.cornerRadius = 17.5;
    
    _userImageView.layer.masksToBounds = YES;
    
}


- (void)setCellLayout:(CommentCellLayout *)cellLayout {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _cellLayout = cellLayout;
    
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:_cellLayout.commentModel.avartar]];
    
    self.userLabel.text = _cellLayout.commentModel.userName;
    
    self.dateLabel.text = _cellLayout.commentModel.create_at;
    
    self.titleLabel.text = _cellLayout.commentModel.title;
    
    self.descLabel.text = _cellLayout.commentModel.desc;
    
    self.descLabel.frame = _cellLayout.commentDescFrame;
    
    [self showImageWithUrls:_cellLayout.commentModel.thumbsArray];
    
    for (NSInteger i = 0; i < kImageCount; i ++) {
        UIImageView *imageView = self.imageViewArray[i];
        
        
        if (_cellLayout.imageFrameArray.count != 0) {
            imageView.frame = [_cellLayout.imageFrameArray[i] CGRectValue];
        }
        
        
        
    }
}

- (void)showImageWithUrls:(NSArray *)urls {
    
    
    for (NSInteger i = 0; i < urls.count; i ++) {
        
        UIImageView *imageView = self.imageViewArray[i];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:urls[i]]];
    }
    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
