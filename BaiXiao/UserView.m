//
//  UserView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/18.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "UserView.h"

@implementation UserView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self z_setupViews];
    }
    return self;
}
-(void)z_setupViews
{
    self.backgroudImageView=[[UIImageView alloc]initWithFrame:self.bounds];
    self.backgroudImageView.image=[UIImage imageNamed:@"UserBangroud.jpg"];
    [self addSubview:self.backgroudImageView];
    self.myImageView=[[UIImageView alloc]init];
    //self.myImageView.backgroundColor=[UIColor redColor];
    self.myImageView.frame=CGRectMake(CGRectGetMidX(self.frame)-40, 150, 80, 80);
    self.myImageView.image=[UIImage imageNamed:@"user"];
    self.myImageView.clipsToBounds=YES;
    self.myImageView.layer.cornerRadius=10;
    [self addSubview:self.myImageView];
    
    self.nameLabel=[[UILabel alloc]init];
    //self.nameLabel.backgroundColor=[UIColor redColor];
    self.nameLabel.frame=CGRectMake(CGRectGetWidth(self.frame)/2-70, CGRectGetMaxY(self.myImageView.frame)+5,140, 25);
    self.nameLabel.font=[UIFont systemFontOfSize:13];
    self.nameLabel.textAlignment=NSTextAlignmentCenter;
    self.nameLabel.textColor=[UIColor whiteColor];
    [self addSubview:self.nameLabel];
    
//    self.loginButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
//    self.loginButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
//    self.loginButton.frame=CGRectMake(CGRectGetMinX(self.myImageView.frame)+10, CGRectGetMaxY(self.nameLabel.frame)+10, CGRectGetWidth(self.myImageView.frame)-20, 25);
//    self.loginButton.layer.cornerRadius=5;
//    [self.loginButton setTitle:@"登陆" forState:(UIControlStateNormal)];
//    [self addSubview:self.loginButton];
    
    self.logoutButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.logoutButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.logoutButton.frame=CGRectMake(CGRectGetMinX(self.myImageView.frame)+10, CGRectGetMaxY(self.nameLabel.frame)+10, CGRectGetWidth(self.myImageView.frame)-20, 25);
    self.logoutButton.layer.cornerRadius=5;
    [self.logoutButton setTitle:@"注销" forState:(UIControlStateNormal)];
    [self addSubview:self.logoutButton];
    
    self.collectButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.collectButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.collectButton.frame=CGRectMake(CGRectGetMidX(self.frame)-60, CGRectGetMaxY(self.logoutButton.frame)+20, 120, 30);
    [self.collectButton setTitle:@"关于" forState:(UIControlStateNormal)];
    self.collectButton.layer.cornerRadius=2;
    [self addSubview:self.collectButton];
    
    self.setButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.setButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.setButton.frame=CGRectMake(CGRectGetMidX(self.frame)-60, CGRectGetMaxY(self.collectButton.frame)+20, 120, 30);
    [self.setButton setTitle:@"设置" forState:(UIControlStateNormal)];
    self.setButton.layer.cornerRadius=2;
    [self addSubview:self.setButton];
}

@end
