//
//  CarDetailViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/15.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarDetailViewController.h"
#import "CarDetailView.h"
#import "UrlHeader.h"
#import "UIImageView+WebCache.h"
#import "CarListViewController.h"
#import "CarVideoListViewController.h"
#import "CarConfigurationTableViewController.h"
@interface CarDetailViewController ()
@property(strong,nonatomic)CarDetailView *cv;
@property(strong,nonatomic)NSString *name;
@end

@implementation CarDetailViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self z_makeData];
}
-(void)loadView
{
    self.cv=[[CarDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view=self.cv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.carname;
    self.cv.scrollView.contentSize=CGSizeMake(0,0);
    //开交互
    self.cv.myImageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myImageViewAction)];
    [self.cv.myImageView addGestureRecognizer:singleTap];
    [self z_buttonAction];
}
#pragma mark---------------添加点击事件------------
-(void)z_buttonAction
{
    [self.cv.button1 addTarget:self action:@selector(button1Action:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.cv.button2 addTarget:self action:@selector(button2Action:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
}
#pragma mark----------------点击事件-------------
-(void)myImageViewAction
{
    CarListViewController *carVC=[[CarListViewController alloc]init];
    
    carVC.carID=self.carID;
    [self.navigationController showViewController:carVC sender:nil];

}
-(void)button1Action:(UIButton *)sender
{
    CarConfigurationTableViewController *carConfigration=[[CarConfigurationTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
    carConfigration.carID=self.carID;
    [self.navigationController showViewController:carConfigration sender:nil];
}
-(void)button2Action:(UIButton *)sender
{
    CarVideoListViewController *carVC=[[CarVideoListViewController alloc]initWithStyle:(UITableViewStylePlain)];
    carVC.carID=self.carID;
    carVC.carName=self.name;
   // NSLog(@"");
    [self.navigationController showViewController:carVC sender:nil];
    

}

#pragma mark-----------数据-------------------------
-(void)z_makeData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@&provinceid=110000&cityid=110100&salestate=1",kCarUrl,self.carID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (data !=nil) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSDictionary *dict=dic[@"result"];

        dispatch_async(dispatch_get_main_queue(), ^{
            
        
        [self.cv.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"logo"]]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.cv.myInageViewLabel.text=[NSString stringWithFormat:@"%@/%@",dict[@"fctname"],dict[@"levelname"]];
        self.cv.imageCountLabel.text=[NSString stringWithFormat:@"%@张图片",dict[@"piccount"]];
        self.cv.namelabel.text=[NSString stringWithFormat:@"  %@",dict[@"name"]];
        self.cv.priceLabel.text= [NSString stringWithFormat:@"  ￥%@万",dict[@"fctprice"]];
            
        });
        self.name=dict[@"fctname"];
        
    }
   // NSLog(@"%@",data);
    }];
    [task resume];

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
