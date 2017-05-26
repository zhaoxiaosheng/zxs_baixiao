//
//  LoginViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import <AVUser.h>
#import "RegisterViewController.h"
#import "UserViewController.h"
#import "RootTabBarViewController.h"
@interface LoginViewController ()
@property(strong,nonatomic)LoginView *lv;

@property(copy,nonatomic)NSString *userName;
@property(copy,nonatomic)NSString *password;
@end

@implementation LoginViewController
- (void)viewWillAppear:(BOOL)animated
{
    
    // 注册成功后自动登录
    if ([AVUser currentUser]) {
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

-(void)loadView
{
    
    self.lv=[[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view=self.lv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationController.navigationBarHidden=YES;
    [self z_addAction];
}
-(void)z_addAction
{
//    [self.lv.cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.lv.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.lv.cancelButton addTarget:self action:@selector(logonAction:) forControlEvents:(UIControlEventTouchUpInside)];
}
-(void)loginButtonAction:(UIButton *)sender
{
    if (self.lv.nameText.text.length==0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名不能为空" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];

    }else if((self.lv.nameText.text.length!=0) &&(self.lv.passwordText.text.length == 0)){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不能为空" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }else{
    [AVUser logInWithUsernameInBackground:self.lv.nameText.text password:self.lv.passwordText.text block:^(AVUser *user, NSError *error) {
        
        if (user) {
            RootTabBarViewController *rootBVC=[[RootTabBarViewController alloc]init];
            [self.navigationController pushViewController:rootBVC animated:YES];
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            
        } else {
            
            int errorCode = [(NSNumber *)error.userInfo[@"code"] intValue] ;
            
            if (errorCode == 211) {
                
                [self p_showAlertWithMessage:@"用户不存在!"];
            } else if (errorCode == 210) {
                
                [self p_showAlertWithMessage:@"密码不正确!"];
            }
            
        }

     
    }];
    }

}
- (void)p_showAlertWithMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"⚠️警告" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
}
-(void)logonAction:(UIButton *)sender
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    
    registerVC.login = ^(NSString *username, NSString *password){
        
        
        [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
            
            if (user != nil) {
                NSLog(@"登录成功");
                RootTabBarViewController *rootBVC=[[RootTabBarViewController alloc]init];
                [self.navigationController pushViewController:rootBVC animated:YES];
            } else {
                
                int errorCode = [(NSNumber *)error.userInfo[@"code"] intValue] ;
                
                if (errorCode == 211) {
                    
                    [self p_showAlertWithMessage:@"用户不存在!"];
                } else if (errorCode == 210) {
                    
                    [self p_showAlertWithMessage:@"密码不正确!"];
                }
            }
        }];
    };
    
    [self showViewController:registerVC sender:nil];
    

}
//-(void)cancelButtonAction:(UIButton *)sender
//{
//    RootTabBarViewController *rootVC=[[RootTabBarViewController alloc]init];
//    [self showViewController:rootVC sender:nil];
//
//}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
