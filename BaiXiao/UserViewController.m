//
//  UserViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/18.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "UserViewController.h"
#import "UserView.h"
#import "LoginViewController.h"
#import <AVUser.h>
#import "SetViewController.h"
#import <AVOSCloud.h>
#import "CollectViewController.h"
@interface UserViewController ()
@property(strong,nonatomic)UserView *uv;

@property (assign, nonatomic) BOOL isLogin;
@end

@implementation UserViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if ([AVUser currentUser]) {
        
        // 当前是否有用户登陆，如果有改为注销
        self.isLogin = YES;
        self.uv.nameLabel.text = [AVUser currentUser].username;
    }
    AVUser * currentUser = [AVUser currentUser];
    if (currentUser == nil) {
         self.uv.nameLabel.text = @"请点击登录";
        self.uv.nameLabel.textColor=[UIColor colorWithWhite:1 alpha:0.9];
          self.uv.myImageView.image = [UIImage imageNamed:@"user"];
    }else{
        self.uv.nameLabel.text = currentUser.username;
        AVQuery * query = [AVQuery queryWithClassName:@"UserImage"];
        [query whereKey:@"UserId" equalTo:currentUser.objectId];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                
                NSData * data = [objects.lastObject valueForKey:@"Image"];
                if (data!=nil) {
                    self.uv.myImageView.image = [UIImage imageWithData:data];
                }else{
                    self.uv.myImageView.image = [UIImage imageNamed:@"user"];
                }
                
                
                
            }else{
                NSLog(@"错误");
            }
        }];
    }


}
-(void)loadView
{
    self.uv=[[UserView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view=self.uv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"用户";
    
       
    [self z_addAction];
    
}
#pragma mark----------添加点击方法-------------
-(void)z_addAction
{
//    [self.uv.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.uv.logoutButton addTarget:self action:@selector(logoutAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.uv.collectButton addTarget:self action:@selector(collectButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.uv.setButton addTarget:self action:@selector(setButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
}
#pragma mark---------点击方法-------------------
//登陆
-(void)loginButtonAction:(UIButton *)sender
{
    if (self.isLogin == NO) {
        LoginViewController *loginVC=[[LoginViewController alloc]init];
        
        [self presentViewController:loginVC animated:YES completion:nil ];
    }else{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"当前为登陆状态" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    
    }
    


}
//注销
-(void)logoutAction:(UIButton *)sender
{
    if (self.isLogin == YES) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
        
        UIAlertAction *logOut = [UIAlertAction actionWithTitle:@"注销用户" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            // 注销用户
            [AVUser logOut];
            // 更改状态
            self.isLogin = NO;
            self.uv.nameLabel.text=nil;
            //注销后调用一下viewwillAppear可以起到一点刷新UI的作用
            [self viewWillAppear:YES];
            LoginViewController *loginVC=[[LoginViewController alloc]init];
            [self presentViewController:loginVC animated:YES completion:^{
                
            }];
        }];
        
        UIAlertAction *canel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        
        [alert addAction:logOut];
        [alert addAction:canel];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];

    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有用户在登陆" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];

    
    }
    
}
//关于
-(void)collectButtonAction
{
    CollectViewController *collectVC=[[CollectViewController alloc]init];
    [self.navigationController pushViewController:collectVC animated:YES];
}
//设置
-(void)setButtonAction:(UIButton *)sender
{
    SetViewController *setVC=[[SetViewController alloc]init];
    
    [self.navigationController pushViewController:setVC animated:YES];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
