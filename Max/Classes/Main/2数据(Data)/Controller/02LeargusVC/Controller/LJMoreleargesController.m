//
//  LJMoreleargesController.m
//  Max
//
//  Created by MJ on 16/5/29.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "LJMoreleargesController.h"
#import "LeaguesController.h"

#import "AFNetworking.h"
#import "YYModel.h"
#import "MoreLeargusModel.h"

#import "LJMoreLeargusFlowyout.h"
#import "MJRefresh.h"
#import "LJMoreLeargusCell.h"

#define kItemWidth ((kScreenWidth-30)/2)
#define kItemHeight ((kScreenWidth-30)/2 * 0.75)

@interface LJMoreleargesController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *moreLeargus;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation LJMoreleargesController
- (NSMutableArray *)moreLeargus {

    if (!_moreLeargus) {
        _moreLeargus = [NSMutableArray array];
    }
    return _moreLeargus;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor clearColor];
    [self _setupData];

//    [self setupRefresh];
}
/**
 *  加载UI
 */
- (void)_setupTableView {

//    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds];
// 
//    [self.view addSubview:self.collectionView];

            [self setupLayout];
}

/**
 *  加载数据
 */
- (void)_setupData {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *recommendBodyPath = @"http://api.maxjia.com:80/api/league/list/?lang=zh-cn&os_type=iOS&os_version=9.3.2&_time=1464485173&version=3.3.4&device_id=1EEFF47D-8483-47FA-AD6A-B24499E2CF73&game_type=dota2&limit=30&offset=0";

    [manager GET:recommendBodyPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


        NSArray *datas = responseObject[@"result"];

        for (NSDictionary *dic in datas) {
            MoreLeargusModel *moreleagues = [MoreLeargusModel yy_modelWithDictionary:dic];
            [self.moreLeargus addObject:moreleagues];
        }
        
        // 2.加载UI
        [self _setupTableView];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"error:%@",error);
        
    }];
    
}







//- (void)setupRefresh
//{
//    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewShops)];
//    [self.collectionView.header beginRefreshing];
//
//    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreShops)];
//    self.collectionView.footer.hidden = YES;
//}

- (void)loadNewShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSArray *shops = [XMGShop objectArrayWithFilename:@"1.plist"];
//        [self.shops removeAllObjects];
//        [self.shops addObjectsFromArray:shops];

        // 刷新数据
        [self.collectionView reloadData];

//        [self.collectionView.header endRefreshing];
    });
}

- (void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSArray *shops = [XMGShop objectArrayWithFilename:@"1.plist"];
//        [self.shops addObjectsFromArray:shops];

        // 刷新数据
        [self.collectionView reloadData];

//        [self.collectionView.footer endRefreshing];/
    });
}


static NSString * const LYHCellID = @"LJMoreLeargusCell";
- (void)setupLayout
{
    // 创建布局
//    XMGWaterflowLayout *layout = [[XMGWaterflowLayout alloc] init];
//    layout.delegate = self;

    LJMoreLeargusFlowyout *layout = [[LJMoreLeargusFlowyout alloc] init];

        //适配，一行4个

        layout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);


    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView = collectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:collectionView];

    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LJMoreLeargusCell class]) bundle:nil] forCellWithReuseIdentifier:LYHCellID];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//        self.collectionView.footer.hidden = self.moreLeargus.count == 0;
    NSLog(@"%lu", (unsigned long)self.moreLeargus.count);
    return self.moreLeargus.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LJMoreLeargusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LYHCellID forIndexPath:indexPath];

    cell.moreLeargusModel = self.moreLeargus[indexPath.item];

    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(kItemWidth, kItemHeight);
//}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建VC
    LeaguesController *leargusVC = [[LeaguesController alloc] init];

    MoreLeargusModel *moreLeargusModel = self.moreLeargus[indexPath.item];
    leargusVC.title = moreLeargusModel.name;

    //弹出视图控制器
    [self.navigationController pushViewController:leargusVC animated:YES];
}



@end
