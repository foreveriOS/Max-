//
//  BindingViewController.m
//  Max+
//
//  Created by MJ on 16/5/26.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "BindingViewController.h"

#import "LJBindingTopCell.h"
#import "LJCacheCell.h"

@interface BindingViewController () <UITableViewDataSource,UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *sizeLabel;
@end

@implementation BindingViewController
{
    NSMutableArray *_dataSourceArray;

        NSString *_userName;
        UIImage *_userIcon;

}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self initData];
    [self initViews];
    [self getDataFromSandBox];
}

-(void)initData{
    _dataSourceArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
    [dic1 setObject:@"团购订单" forKey:@"title"];
    [dic1 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic1];
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setObject:@"预定订单" forKey:@"title"];
    [dic2 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic2];
//    NSMutableDictionary *dic3 = [[NSMutableDictionary alloc] init];
//    [dic3 setObject:@"上门订单" forKey:@"title"];
//    [dic3 setObject:@"icon_mine_onsite" forKey:@"image"];
//    [_dataSourceArray addObject:dic3];
//    NSMutableDictionary *dic4 = [[NSMutableDictionary alloc] init];
//    [dic4 setObject:@"我的评价" forKey:@"title"];
//    [dic4 setObject:@"icon_mine_onsite" forKey:@"image"];
//    [_dataSourceArray addObject:dic4];
//    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc] init];
//    [dic5 setObject:@"每日推荐" forKey:@"title"];
//    [dic5 setObject:@"icon_mine_onsite" forKey:@"image"];
//    [_dataSourceArray addObject:dic5];
//    NSMutableDictionary *dic6 = [[NSMutableDictionary alloc] init];
//    [dic6 setObject:@"会员俱乐部" forKey:@"title"];
//    [dic6 setObject:@"icon_mine_onsite" forKey:@"image"];
//    [_dataSourceArray addObject:dic6];
//    NSMutableDictionary *dic7 = [[NSMutableDictionary alloc] init];
//    [dic7 setObject:@"我的抽奖" forKey:@"title"];
//    [dic7 setObject:@"icon_mine_onsite" forKey:@"image"];
//    [_dataSourceArray addObject:dic7];
//    NSMutableDictionary *dic8 = [[NSMutableDictionary alloc] init];
//    [dic8 setObject:@"我的抵用券" forKey:@"title"];
//    [dic8 setObject:@"icon_mine_onsite" forKey:@"image"];
//    [_dataSourceArray addObject:dic8];

}

-(void)initViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
//        return 8;
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 30;
    }else{
        return 15;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kScreenWidth/2;
    }else{
        return 60;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 75)];
    footerView.backgroundColor = RGB(239, 239, 244);
    return footerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {

        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
        UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
        userNameLabel.font = [UIFont systemFontOfSize:13];
        userNameLabel.text = @"我的账号";
        [headerView addSubview:userNameLabel];


        return headerView;
    }else{
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
        headerView.backgroundColor = RGB(239, 239, 244);
        return headerView;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            static NSString *cellIndentifier = @"mineCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            }

            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:13];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"直接通过stream认证";

            cell.textLabel.text = label.text;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

            cell.textLabel.font = [UIFont systemFontOfSize:15];
            return cell;
        } else {

            LJCacheCell *cell = [LJCacheCell cacheWithCell];
            cell.cacheView.text = self.sizeLabel;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

            return cell;
        }

    }else{
        LJBindingTopCell *cell = [LJBindingTopCell bindingWithCell];
        cell.titleView.text = _userName;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.iconView.image = _userIcon;
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section != 0) {

        if (indexPath.row == 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"该功能需要登录使用" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"去登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

            }];
            [alert addAction:action];
            UIAlertAction *action_2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

            }];
            [alert addAction:action_2];

            [self presentViewController:alert animated:YES completion:nil];
        } else {

            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定清除缓存" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

                self.sizeLabel = @"0.0";
                [self clearCatch];
                [self.tableView reloadData];
            }];
            [alert addAction:action];
            UIAlertAction *action_2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

            }];
            [alert addAction:action_2];

            [self presentViewController:alert animated:YES completion:nil];
        }

    } else {

        UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePickerVC.sourceType = sourceType;
        imagePickerVC.delegate = self;

        [self presentViewController:imagePickerVC animated:YES completion:^{

        }];
    }
}




//从沙盒当中获取数据
- (void)getDataFromSandBox
{
    _userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    _userIcon = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"userIcon"]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
//保存数据到沙盒当中
- (void)saveDataToSandBox
{
    if (_userIcon) {
        //系统设定的类，用于app的一些基础设置 plist ， 归档 ， 数据库 ， CoreData
        [[NSUserDefaults standardUserDefaults] setObject:_userName forKey:@"userName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //一定要转换成Data 第二个参数表示压缩比率0 最大 1 最小
        NSData *data = UIImageJPEGRepresentation(_userIcon, 0.8);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"userIcon"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

}
#pragma mark - imagePickerCV 代理方法  获取图片的delegate 在相册当中选择图片时调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0) {



}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    [picker dismissViewControllerAnimated:YES completion:NULL];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _userIcon = image;
    _userName = [NSString stringWithFormat:@"爱你久久"];

    [self.tableView reloadData];
    [self saveDataToSandBox];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {


}

#pragma mark - 清理缓存
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self readCatchSize];
}

- (void)readCatchSize
{
    NSInteger fileSize = [self getCatchSize];

    self.sizeLabel = [NSString stringWithFormat:@"%.2f MB", fileSize / 1024.0 / 1024.0];
    [self.tableView reloadData];
}
- (NSInteger)getCatchSize
{
    NSInteger fileSize = 0;

    //拿到缓存文件夹
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    //拿到缓存文件夹下的所有文件的属性
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:catchPath];
    //所有的文件的名称
    for (NSString *fileName in fileEnumerator) {
        //所有文件的路径
        NSString *filePath = [catchPath stringByAppendingPathComponent:fileName];
        //所有文件的大小
        NSDictionary *attDic = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        //   计算大小
        fileSize += [attDic fileSize];
    }

    return fileSize;
}

- (void)clearCatch
{
    //拿到缓存文件夹
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    //清除
    [[NSFileManager defaultManager] removeItemAtPath:catchPath error:NULL];
}
@end
