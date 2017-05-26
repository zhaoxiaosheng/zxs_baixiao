//
//  RegisterView.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView


@property (nonatomic, strong) UITextField *userNameTf;

@property (nonatomic, strong) UITextField *passwordTf;

@property (nonatomic, strong) UITextField *confirmPasswordTf;

@property (nonatomic, strong) UITextField *emailTf;

@property (nonatomic, strong) UITextField *telTf;

@property(nonatomic,strong)UIButton *cancelButton;

@property(nonatomic,strong)UIButton *SubmitButton;
@end
