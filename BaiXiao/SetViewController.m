//
//  SetViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "SetViewController.h"
#import "SetView.h"
#import <AVUser.h>
#import <AVOSCloud.h>
@interface SetViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(strong,nonatomic)SetView *sv;
@end

@implementation SetViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AVUser * currentUser = [AVUser currentUser];
    if (currentUser == nil) {
       self.sv.nameText.placeholder= @"请点击登录";
        
       self.sv.myImageView.image = [UIImage imageNamed:@"user"];
    }else{
        self.sv.nameText.text = currentUser.username;
        AVQuery * query = [AVQuery queryWithClassName:@"UserImage"];
        [query whereKey:@"UserId" equalTo:currentUser.objectId];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                
                NSData * data = [objects.lastObject valueForKey:@"Image"];
                if (data!=nil) {
                    self.sv.myImageView.image = [UIImage imageWithData:data];
                }else{
                    self.sv.myImageView.image = [UIImage imageNamed:@"user"];
                }
                
                
            }else{
                NSLog(@"错误");
            }
        }];
    }

}

-(void)loadView
{
    self.sv=[[SetView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view=self.sv;
    
    [self.sv.submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
}
//保存修改
-(void)submitButtonAction
{
    AVUser * currentUser = [AVUser currentUser];
    currentUser.username=self.sv.nameText.text;
    //修改后保存
    [currentUser save];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //开交互
    self.sv.myImageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myImageViewAction)];
    [self.sv.myImageView addGestureRecognizer:singleTap];

    //取消
    [self.sv.cancelButton addTarget:self action:@selector(cancelButton:) forControlEvents:(UIControlEventTouchUpInside)];
}
-(void)myImageViewAction
{
    //照片控制器
    UIImagePickerController * p = [[UIImagePickerController alloc] init];
    //源类型
    p.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //允许编辑
    p.allowsEditing = YES;
    p.delegate = self;
    [self presentViewController:p animated:YES completion:nil];

}
-(void)cancelButton:(UIButton *)sender
{
[self.navigationController popViewControllerAnimated:YES];

}
#pragma mark ---imagepicker的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImageView * imv = self.sv.myImageView;
    imv.image = info[UIImagePickerControllerEditedImage];
    
    //上传
    AVUser * user = [AVUser currentUser];
    AVObject *post = [AVObject objectWithClassName:@"UserImage"];
    [post setObject:user.objectId forKey:@"UserId"];
    //NSLog(@"%@", imv.image);
    NSData * data = UIImageJPEGRepresentation(imv.image, 0.7);
    [post setObject:data forKey:@"Image"];
    [post save];
    
    AVQuery * query = [AVQuery queryWithClassName:@"UserImage"];
    [query whereKey:@"UserId" equalTo:user.objectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            NSData * data = [objects.lastObject valueForKey:@"Image"];
            if (data!=nil) {
                self.sv.myImageView.image = [UIImage imageWithData:data];
            }else{
                self.sv.myImageView.image = [UIImage imageNamed:@"user"];
            }
            
            
        }else{
            NSLog(@"错误");
        }
    }];

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
