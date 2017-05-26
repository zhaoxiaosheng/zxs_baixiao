//
//  RootViewCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/12.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "RootViewCell.h"
#define kFont13 [UIScreen mainScreen].bounds.size.width/31.25
@implementation RootViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}
-(void)p_setupViews
{
    
    self.imageView=[[UIImageView alloc]initWithFrame:self.contentView.bounds];
   // self.imageView.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:self.imageView];
    
    self.label=[[UILabel alloc]init];
   // self.label.backgroundColor=[UIColor greenColor];
    self.label.frame=CGRectMake(CGRectGetMinX(self.imageView.frame), CGRectGetMaxY(self.imageView.frame), CGRectGetWidth(self.imageView.frame), 30);
    self.label.font=[UIFont systemFontOfSize:kFont13];
    self.label.textAlignment=UIBaselineAdjustmentAlignCenters;
    [self.contentView addSubview:self.label];
    
    
}
@end
