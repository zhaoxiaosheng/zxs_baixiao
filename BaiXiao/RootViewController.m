//
//  RootViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/12.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "RootViewController.h"
#import "RootViewCell.h"
#import "UrlHeader.h"
#import "Root.h"
#import "UIImageView+WebCache.h"
#import "QuotationTableViewController.h"
#import "CollectionReusableView.h"
#import "MBProgressHUD.h"
@interface RootViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(strong,nonatomic)NSMutableArray *dataArray;
@property(strong,nonatomic)UICollectionView *collectionView;

@property(strong,nonatomic)MBProgressHUD *hud;
@end

@implementation RootViewController
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"数码类";
    
   //布局
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
   //每个Item 的大小
    layout.itemSize=CGSizeMake((CGRectGetWidth(self.view.frame)-135)/3,(CGRectGetWidth(self.view.frame)-135)/3);
    layout.minimumLineSpacing=50;
    layout.minimumInteritemSpacing=10;
    
    layout.sectionInset=UIEdgeInsetsMake(20, 20, 80, 20);
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) collectionViewLayout:layout];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    //设置头视图大小
    layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 220);
    //注册
    [self.collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse"];
    //设置代理
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.view addSubview:self.collectionView];
    
    //注册
    [self.collectionView registerClass:[RootViewCell class] forCellWithReuseIdentifier:@"cell"];
    
//    [self.collectionView registerClass:[RootViewCell class] forCellWithReuseIdentifier:@"ListCell"];
    
    [self p_makeData];
}
#pragma mark-----数据-------
-(void)p_makeData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:kRootUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSArray *arr=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
    for (NSDictionary *dic in arr) {

        if([[dic allKeys] count] == 6){
          
            Root *root=[[Root alloc]init];
            
            [root setValuesForKeysWithDictionary:dic];
            
        
            [self.dataArray addObject:root];
            
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    //NSLog(@"%ld",self.dataArray.count);
   
}];
    [task resume];

}
#pragma mark-----代理方法-----



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RootViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        Root *root=self.dataArray[indexPath.item];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",root.src]]];
        cell.label.text=root.name;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    QuotationTableViewController *TVC=[[QuotationTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
           Root * r=self.dataArray[indexPath.item];
            TVC.rootID = r.subId;
            TVC.rootTitle = r.name;
        [self.navigationController showViewController:TVC sender:nil];
    
}
#pragma mark-----头视图方法---------
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionReusableView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerReuse" forIndexPath:indexPath];
    //headerView.userInteractionEnabled=YES;
    //隐藏ScrollView滚动条
    headerView.ScrollView.showsVerticalScrollIndicator = FALSE;
    headerView.ScrollView.showsHorizontalScrollIndicator = FALSE;
    return headerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
