//
//  CarImageDetailViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarImageDetailViewController.h"
#import "CarImageDetailView.h"
#import "UIImageView+WebCache.h"

@interface CarImageDetailViewController ()
@property(strong,nonatomic)CarImageDetailView *cidv;
@end

@implementation CarImageDetailViewController
-(void)viewWillAppear:(BOOL)animated
{   //开启后可以设置圆角
    self.cidv.myImageView.clipsToBounds = YES;
    self.cidv.myImageView.layer.cornerRadius=2;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.cidv.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.picUrl]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.cidv.nameLabel.text=self.name;
    });
    
   
    

}
-(void)loadView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.cidv=[[CarImageDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view=self.cidv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
