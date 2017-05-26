//
//  SetView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "SetView.h"

@implementation SetView

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
   // self.myImageView.backgroundColor=[UIColor blueColor];
    self.myImageView.frame=CGRectMake(CGRectGetWidth(self.frame)/2-40, 100, 80, 80);
    self.myImageView.image=[UIImage imageNamed:@"user"];
    [self addSubview:self.myImageView];
    
    self.prompt=[[UILabel alloc]init];
    self.prompt.frame=CGRectMake(20, CGRectGetMaxY(self.myImageView.frame)+10, self.frame.size.width-40, 40);
    self.prompt.text=@"点击头像修改";
    self.prompt.textColor=[UIColor colorWithWhite:0.7 alpha:0.9];
    self.prompt.textAlignment=NSTextAlignmentCenter;
    [self addSubview:self.prompt];
    
    self.nameText=[[UITextField alloc]init];
    //self.nameText.backgroundColor=[UIColor yellowColor];
    self.nameText.frame=CGRectMake(CGRectGetWidth(self.frame)/2-70, CGRectGetMaxY(self.prompt.frame)+30, 140, 25);
    //边框样式
    self.nameText.borderStyle=UITextBorderStyleRoundedRect;
    //clearButton出现时间
    self.nameText.clearButtonMode=UITextFieldViewModeAlways;
    [self addSubview:self.nameText];
    
    self.cancelButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.cancelButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.cancelButton.frame=CGRectMake(CGRectGetWidth(self.frame)/2-115, CGRectGetMaxY(self.nameText.frame)+30, 100, 30);
    self.cancelButton.layer.cornerRadius=5;
    [self.cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
    [self addSubview:self.cancelButton];
    
    self.submitButton=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.submitButton.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    self.submitButton.frame=CGRectMake(CGRectGetMaxX(self.cancelButton.frame)+30, CGRectGetMinY(self.cancelButton.frame), CGRectGetWidth(self.cancelButton.frame), CGRectGetHeight(self.cancelButton.frame));
    self.submitButton.layer.cornerRadius=5;
    [self.submitButton setTitle:@"确定" forState:(UIControlStateNormal)];
    [self addSubview:self.submitButton];

}
@end
