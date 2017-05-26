//
//  LoginView.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/18.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView
@property(strong,nonatomic)UIImageView *myImageView;//头像
@property(strong,nonatomic)UILabel *nameLabel;//用户名
@property(strong,nonatomic)UITextField *nameText;//账号
@property(strong,nonatomic)UILabel *passwordLabel;//密码
@property(strong,nonatomic)UITextField *passwordText;//密码输入
@property(strong,nonatomic)UIButton *loginButton;//登陆
@property(strong,nonatomic)UIButton *cancelButton;//取消
@property(strong,nonatomic)UILabel *hintLabel;//提示
@property(strong,nonatomic)UIButton *logonButton;//注册

@end
