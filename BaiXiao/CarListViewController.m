//
//  CarListViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarListViewController.h"
#import "CarListCollectionViewCell.h"
#import "UrlHeader.h"
#import "CarImageListModel.h"
#import "UIImageView+WebCache.h"
#import "CarImageDetailViewController.h"
@interface CarListViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UICollectionView *collectionView;
@property(strong,nonatomic)NSMutableArray *dataArray;
@end

@implementation CarListViewController
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //布局
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //每个Item 的大小
    layout.itemSize=CGSizeMake((CGRectGetWidth(self.view.frame)-24)/3, (CGRectGetWidth(self.view.frame)-24)/3-28);
    layout.minimumLineSpacing=5;
    layout.minimumInteritemSpacing=5;
    
    layout.sectionInset=UIEdgeInsetsMake(5, 5, 10, 5);
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) collectionViewLayout:layout];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    //设置代理
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[CarListCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self z_makeData];

}
#pragma mark------------数据--------------------
-(void)z_makeData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@&specid=0&pagesize=60&pageindex=1",kImageUrl,self.carID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (data !=nil) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        for (NSDictionary *dict in dic[@"result"][@"list"]) {
            CarImageListModel *model=[[CarImageListModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [self.dataArray addObject:model];
        }

    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    
}];
    [task resume];

}
#pragma mark-----------collectionView代理方法-----------
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CarListCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    CarImageListModel *model=self.dataArray[indexPath.item];
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:model.smallpic] placeholderImage:[UIImage imageNamed:@"placeholder"]];

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CarImageDetailViewController *carImageVC=[[CarImageDetailViewController alloc]init];
    CarImageListModel *model=self.dataArray[indexPath.item];
    carImageVC.picUrl=model.smallpic;
    carImageVC.piccount=model.rowcount;
    carImageVC.name=model.specname;
    
    [self.navigationController showViewController:carImageVC sender:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
