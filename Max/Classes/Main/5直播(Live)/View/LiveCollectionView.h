//
//  LiveCollectionView.h
//  Max
//
//  Created by clip on 16/5/31.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveCollectionView : UICollectionView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *liveModelArray;

@end
