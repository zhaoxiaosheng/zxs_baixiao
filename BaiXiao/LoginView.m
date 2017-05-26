//
//  LoginView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/18.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self z_setupViews];
    }
    return self;
}
-(void)z_setupViews
{
    self.backgroundColor=[UIColor whiteColor];
    
    self.myImageView=[[UIImageView alloc]init];
   // self.myImageView.backgroundColor=[UIColor grayColor];
    self.myImageView.image=[UIImage imageNamed:@"icon"];
    self.myImageView.frame=CGRectMake(CGRectGetWidth(self.frame)/2-40, CGRectGetWidth(self.frame)/2-100, 80, 80);
    self.myImageView.layer.borderWidth=2;
    self.myImageView.layer.borderColor=[UIColor colorWithWhite:0.9 alpha:0.8].CGColor;
    self.myImageView.layer.cornerRadius=10;
    [self addSubview:self.myImageView];
    
    UILabel *nnlabel=[[UILabel alloc]init];
    //nnlabel.backgroundColor=[UIColor redColor];
    nnlabel.frame=CGRectMake(CGRectGetWidth(self.frame)/2-70, CGRectGetMaxY(self.myImageView.frame)+5, 140, 30);
    nnlabel.text=@"百小圣报价";
    nnlabel.textColor=[UIColor colorWithRed:1 green:0.7647 blue:0 alpha:1];
    nnlabel.textAlignment=NSTextAlignmentCenter;
    [nnlabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self addSubview:nnlabel];
    
    
    self.nameLabel =[[UILabel alloc]init];
   // self.nameLabel.backgroundColor=[UIColor redColor];
    self.nameLabel.frame=CGRectMake(20, CGRectGetMaxY(nnlabel.frame)+30, 100, 40);
    self.nameLabel.text=@"用户名：";
    self.nameLabel.textAlignment=NSTextAlignmentRight;
    [self addSubview:self.nameLabel];
    
    self.nameText=[[UITextField alloc]init];
   // self.nameText.backgroundColor=[UIColor blueColor];
    self.nameText.frame=CGRectMake(CGRectGetMaxX(self.nameLabel.frame)+10, CGRectGetMinY(self.nameLabel.frame), CGRectGetWidth(self.frame)-CGRectGetWidth(self.nameLabel.frame)-80, 40);
    //占位符
    self.nameText.placeholder=@"请输入用户名";
    //边框样式
    self.nameText.borderStyle=UITextBorderStyleRoundedRect;
    //clearButton出现时间
    self.nameText.clearButtonMode=UITextFieldViewModeAlways;
    [self addSubview:self.nameText];
    
    
    self.passwordLabel=[[UILabel alloc]init];
   // self.passwordLabel.backgroundColor=[UIColor redColor];
    self.passwordLabel.frame=CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame)+30, CGRectGetWidth(self.nameLabel.frame),CGRectGetHeight(self.nameLabel.frame));
    self.passwordLabel.text=@"密码：";
    self.passwordLabel.textAlignment=NSTextAlignmentRight;
    [self addSubview:self.passwordLabel];
    
    
    self.passwordText=[[UITextField alloc]init];
    //self.passwordText.backgroundColor=[UIColor blueColor];
    self.passwordText.frame=CGRectMake(CGRectGetMinX(self.nameText.frame), CGRectGetMinY(self.passwordLabel.frame), CGRectGetWidth(self.nameText.frame), CGRectGetHeight(self.nameText.frame));
    //占位符
    self.passwordText.placeholder=@"请输入密码";
    //边框样式
    self.passwordText.borderStyle=UITextBorderStyleRoundedRect;
    //clearButton出现时间
    self.passwordText.clearButtonMode=UITextFieldViewModeAlways;
    self.passwordText.secureTextEntry=YES;
    [self addSubview:self.passwordText];
    
    self.loginButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.loginButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.loginButton.frame=CGRectMake(CGRectGetMidX(self.frame)-115, CGRectGetMaxY(self.passwordLabel.frame)+20, 100, 40);
    [self.loginButton setTitle:@"登陆" forState:(UIControlStateNormal)];
    self.loginButton.layer.cornerRadius=5;
    [self addSubview:self.loginButton];
    
    self.cancelButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.cancelButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.cancelButton.frame=CGRectMake(CGRectGetMaxX(self.loginButton.frame)+30, CGRectGetMinY(self.loginButton.frame), CGRectGetWidth(self.loginButton.frame), CGRectGetHeight(self.loginButton.frame));
    [self.cancelButton setTitle:@"注册" forState:(UIControlStateNormal)];
    self.cancelButton.layer.cornerRadius=5;
    [self addSubview:self.cancelButton];
    
//    self.hintLabel=[[UILabel alloc]init];
//   // self.hintLabel.backgroundColor=[UIColor redColor];
//    self.hintLabel.frame=CGRectMake(CGRectGetMinX(self.loginButton.frame), CGRectGetMaxY(self.loginButton.frame)+5, 150, 30);
//    self.hintLabel.font=[UIFont systemFontOfSize:12];
//    self.hintLabel.text=@"您还没有账号？请点击这里";
//    self.hintLabel.textColor=[UIColor grayColor];
//    self.hintLabel.textAlignment=NSTextAlignmentRight;
//    [self addSubview:self.hintLabel];
    
//    self.logonButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
//    //self.logonButton.backgroundColor=[UIColor redColor];
//    self.logonButton.frame=CGRectMake(CGRectGetMaxX(self.hintLabel.frame), CGRectGetMinY(self.hintLabel.frame),40 , 30);
//    [self.logonButton setTitle:@"注册" forState:(UIControlStateNormal)];
//    self.logonButton.titleLabel.font=[UIFont systemFontOfSize:12];
//    self.logonButton.tintColor=[UIColor greenColor];
//    [self addSubview:self.logonButton];
    
    

}

@end
