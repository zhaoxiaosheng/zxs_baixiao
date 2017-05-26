//
//  RegisterView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self p_setupViews];
    }
    return self;
}

- (void)p_setupViews
{
    self.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *userNameLabel = [[UILabel alloc] init];
    userNameLabel.text = @"用户名:";
    userNameLabel.frame = CGRectMake(25, 64 + 40, 70, 40);
    [self addSubview:userNameLabel];
    
    self.userNameTf = [[UITextField alloc] init];
    self.userNameTf.frame = CGRectMake(CGRectGetMaxX(userNameLabel.frame) + 40, CGRectGetMinY(userNameLabel.frame), 200, 40);
    //    self.login.backgroundColor = [UIColor orangeColor];
    self.userNameTf.borderStyle = UITextBorderStyleRoundedRect;
    self.userNameTf.placeholder = @"请输入用户名";
    [self addSubview:self.userNameTf];
    
    UILabel *passwordLabel = [[UILabel alloc] init];
    passwordLabel.text = @"密码:";
    passwordLabel.frame = CGRectMake(25, CGRectGetMaxY(userNameLabel.frame) + 30, 70, 40);
    //    self.label2.backgroundColor = [UIColor orangeColor];
    [self addSubview:passwordLabel];
    
    self.passwordTf = [[UITextField alloc] init];
    self.passwordTf.frame = CGRectMake(CGRectGetMaxX(passwordLabel.frame) + 40, CGRectGetMinY(passwordLabel.frame), 200, 40);
    //    self.password.backgroundColor = [UIColor orangeColor];
    self.passwordTf.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTf.placeholder = @"请输入密码";
    self.passwordTf.secureTextEntry = YES;
    self.passwordTf.keyboardType = UIKeyboardTypeDefault;
    [self addSubview:self.passwordTf];
    
    UILabel *confirmPasswordLabel = [[UILabel alloc] init];
    confirmPasswordLabel.text = @"确认密码:";
    confirmPasswordLabel.frame = CGRectMake(25, CGRectGetMaxY(passwordLabel.frame) + 30, 100, 40);
    [self addSubview:confirmPasswordLabel];
    
    self.confirmPasswordTf = [[UITextField alloc] init];
    self.confirmPasswordTf.frame = CGRectMake(CGRectGetMaxX(confirmPasswordLabel.frame) + 10, CGRectGetMinY(confirmPasswordLabel.frame), 200, 40);
    //    self.password1.backgroundColor = [UIColor orangeColor];
    self.confirmPasswordTf.borderStyle = UITextBorderStyleRoundedRect;
    self.confirmPasswordTf.placeholder = @"请再次输入密码";
    self.confirmPasswordTf.secureTextEntry = YES;
    self.confirmPasswordTf.keyboardType = UIKeyboardTypeDefault;
    [self addSubview:self.confirmPasswordTf];
    
    UILabel *emailLabel = [[UILabel alloc] init];
    emailLabel.text = @"邮箱:";
    emailLabel.frame = CGRectMake(25, CGRectGetMaxY(confirmPasswordLabel.frame) + 30, 70, 40);
    [self addSubview:emailLabel];
    
    self.emailTf = [[UITextField alloc] init];
    self.emailTf.frame = CGRectMake(CGRectGetMaxX(emailLabel.frame) + 40, CGRectGetMinY(emailLabel.frame), 200, 40);
    //    self.mail.backgroundColor = [UIColor orangeColor];
    self.emailTf.borderStyle = UITextBorderStyleRoundedRect;
    self.emailTf.placeholder = @"请输入邮箱";
    self.emailTf.keyboardType = UIKeyboardTypeEmailAddress;
    [self addSubview:self.emailTf];
    
    UILabel *telLabel = [[UILabel alloc] init];
    telLabel.text = @"联系方式:";
    telLabel.frame = CGRectMake(25, CGRectGetMaxY(emailLabel.frame) + 30, 100, 40);
    [self addSubview:telLabel];
    
    self.telTf = [[UITextField alloc] init];
    self.telTf.frame = CGRectMake(CGRectGetMaxX(telLabel.frame) + 10, CGRectGetMinY(telLabel.frame), 200, 40);
    self.telTf.borderStyle = UITextBorderStyleRoundedRect;
    self.telTf.placeholder = @"请输入联系方式";
    [self addSubview:self.telTf];
    
    self.cancelButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.cancelButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.cancelButton.frame=CGRectMake(CGRectGetWidth(self.frame)/2-115, CGRectGetMaxY(self.telTf.frame)+30, 100, 40);
    [self.cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
    self.cancelButton.layer.cornerRadius=5;
    
    [self addSubview:self.cancelButton];
    
    
    self.SubmitButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.SubmitButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.SubmitButton.frame=CGRectMake(CGRectGetMaxX(self.cancelButton.frame)+30, CGRectGetMinY(self.cancelButton.frame), CGRectGetWidth(self.cancelButton.frame), CGRectGetHeight(self.cancelButton.frame));
    [self.SubmitButton setTitle:@"提交" forState:(UIControlStateNormal)];
    self.SubmitButton.layer.cornerRadius=5;
    [self addSubview:self.SubmitButton];
}


@end
