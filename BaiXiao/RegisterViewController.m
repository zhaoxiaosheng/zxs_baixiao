//
//  RegisterViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "UserViewController.h"
#import "RootTabBarViewController.h"
#import <AVUser.h>
@interface RegisterViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) RegisterView *rv;

@property (nonatomic, assign) BOOL isOk;


@end

@implementation RegisterViewController

- (void)loadView
{
    self.rv = [[RegisterView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.rv;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 添加按钮响应事件
    [self.rv.SubmitButton addTarget:self action:@selector(registerAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.rv.cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    // 为textfiled添加代理
    self.rv.emailTf.delegate = self;
    self.rv.telTf.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 点击屏幕收回键盘
    
    [self.rv.userNameTf resignFirstResponder];
    [self.rv.passwordTf resignFirstResponder];
    [self.rv.confirmPasswordTf resignFirstResponder];
    [self.rv.emailTf resignFirstResponder];
    [self.rv.telTf resignFirstResponder];
    
}
//判断邮箱格式是否正确
-(BOOL)isValidateEmail:(NSString *)email

{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}
#pragma mark - Register
- (void)registerAction:(UIBarButtonItem *)sender
{

    NSArray *txtArray = @[@"用户名不能为空", @"密码不能为空", @"确认密码错误",@"邮箱不能为空",@"邮箱格式不正确"];
    NSString *message = nil;
    
    if (self.rv.userNameTf.text.length == 0) {
        
        message = txtArray[0];
    } else if (self.rv.passwordTf.text.length == 0) {
        
        message = txtArray[1];
    } else if (![self.rv.confirmPasswordTf.text isEqualToString:self.rv.passwordTf.text]) {
        
        message = txtArray[2];
    } else if (self.rv.emailTf.text.length == 0){
        
        message = txtArray[3];
    }else if([self isValidateEmail:self.rv.emailTf.text]==NO)
    {
        message=txtArray[4];
    }else {
        
        self.isOk = YES;
    }
    
    if (self.isOk == NO) {
        
        [self p_showAlertWithMessage:message];
        
    } else {
        
        AVUser *user = [AVUser user];
        user.username = self.rv.userNameTf.text;
        user.password = self.rv.passwordTf.text;
        user.email = self.rv.emailTf.text;
        
        [user setObject:self.rv.telTf.text forKey:@"tel"];
        
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            if (succeeded) {
                
                NSLog(@"完成注册");
                
                // block传值
                self.login(self.rv.userNameTf.text, self.rv.passwordTf.text);
//                RootTabBarViewController *rootBVC=[[RootTabBarViewController alloc]init];
//            [self.navigationController pushViewController:rootBVC animated:YES];
//                UserViewController *userVC=[[UserViewController alloc]init];
//                [self showViewController:userVC sender:nil];
                
            } else {
                
                int errorCode = [(NSNumber *)error.userInfo[@"code"] intValue];
                
                if (errorCode == 124) {
                    
                    [self p_showAlertWithMessage:@"用户名已存在"];
                } else if (errorCode == 203) {
                    
                    [self p_showAlertWithMessage:@"邮箱已被注册"];
                }
            }
            
        }];
        
    }
    
}
-(void)cancelButtonAction:(UIButton *)sender
{
[self.navigationController popViewControllerAnimated:YES];

}
#pragma - mark UITextField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // 计算需要上移的距离
    CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 + 50);
    
    // 如果键盘弹出,实现上移
    if (offset < 0) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect frame = self.view.frame;
            
            frame.origin.y = offset;
            
            self.view.frame = frame;
        }];
    }
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    // 收回键盘，恢复原样
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect frame = self.view.frame;
        
        frame.origin.y = 0;
        
        self.view.frame = frame;
        
    }];
    
    return YES;
}

#pragma mark - Private Method
- (void)p_showAlertWithMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"⚠️警告" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
}

@end
