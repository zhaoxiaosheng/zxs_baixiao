//
//  CarImageDetailView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarImageDetailView.h"

@implementation CarImageDetailView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self z_setupViews];
    }
    return self;
}
-(void)z_setupViews
{
    self.backgroundColor=[UIColor blackColor];
    self.scrollView=[[UIScrollView alloc]init];
    //self.scrollView.backgroundColor=[UIColor blueColor];
    self.scrollView.frame=CGRectMake(0, 200, CGRectGetWidth(self.bounds), 265);
    [self addSubview:self.scrollView];
    
    
    self.myImageView=[[UIImageView alloc]init];
    self.myImageView.backgroundColor=[UIColor redColor];
    
    self.myImageView.frame=self.scrollView.bounds;
    
    [self.scrollView addSubview:self.myImageView];
    
    
    self.nameLabel=[[UILabel alloc]init];
   // self.nameLabel.backgroundColor=[UIColor yellowColor];
    self.nameLabel.frame=CGRectMake(CGRectGetMidX(self.scrollView.frame)-50, CGRectGetMaxY(self.scrollView.frame)+70, 100, 40);
    self.nameLabel.font=[UIFont systemFontOfSize:13];
    self.nameLabel.textColor=[UIColor whiteColor];
    [self addSubview:self.nameLabel];


}
@end
