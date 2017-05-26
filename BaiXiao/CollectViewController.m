//
//  CollectViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 16/5/2.
//  Copyright © 2016年 Z_小圣. All rights reserved.
//

#import "CollectViewController.h"

@interface CollectViewController ()
@property(strong,nonatomic)UILabel *leable;
@property(strong,nonatomic)UILabel *nameLabel;
@property(strong,nonatomic)UIImageView *logoImage;

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor=[UIColor whiteColor];
    
    self.logoImage=[[UIImageView alloc]init];
    self.logoImage.image=[UIImage imageNamed:@"icon.png"];
    self.logoImage.frame=CGRectMake(147.5, 200, 80, 80);
    self.logoImage.layer.borderWidth=2;
    self.logoImage.layer.borderColor=[UIColor colorWithWhite:0.9 alpha:0.8].CGColor;
    self.logoImage.layer.cornerRadius=10;
    [self.view addSubview:self.logoImage];
    
    self.nameLabel=[[UILabel alloc]init];
    self.nameLabel.frame=CGRectMake(100, CGRectGetMaxY(self.logoImage.frame)+20, 200, 40);
    self.nameLabel.text=@"名称：  百小圣报价";
    [self.view addSubview:self.nameLabel];
    
    
    self.leable=[[UILabel alloc]init];
    self.leable.frame=CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame)+10, CGRectGetWidth(self.nameLabel.frame), CGRectGetHeight(self.nameLabel.frame));
    self.leable.text=@"版本： 1.0";
    [self.view addSubview:self.leable];
    // Do any additional setup after loading the view.
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
