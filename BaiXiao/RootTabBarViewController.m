//
//  RootTabBarViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/13.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "RootViewController.h"
#import "CarpriceViewController.h"
#import "UserViewController.h"
@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.alpha=1;
    self.tabBar.tintColor=[UIColor colorWithRed:0.454 green:0.211 blue:0.513 alpha:1];
    self.tabBarController.view.backgroundColor=[UIColor blueColor];
    //用户
    UserViewController *userVC=[[UserViewController alloc]init];
    UINavigationController *userNC=[[UINavigationController alloc]initWithRootViewController:userVC];
    userNC.tabBarItem.title=@"用户";
    userNC.tabBarItem.image=[UIImage imageNamed:@"tabbar_user24px.png"];
    
    //电子产品
    RootViewController *rootVC =[[RootViewController alloc]init];
    UINavigationController *rootNC=[[UINavigationController alloc]initWithRootViewController:rootVC];
    rootNC.tabBarItem.title=@"数码";
    rootNC.tabBarItem.image=[UIImage imageNamed:@"tabbar_shu16px.png"];
    //汽车
    CarpriceViewController *carVC=[[CarpriceViewController alloc]initWithStyle:(UITableViewStylePlain)];
    
    UINavigationController *carNC=[[UINavigationController alloc]initWithRootViewController:carVC];
    carNC.tabBarItem.title=@"汽车";
    carNC.tabBarItem.image=[UIImage imageNamed:@"tabbar_car16px.png"];
    
    
    self.viewControllers =@[rootNC,carNC,userNC];
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
