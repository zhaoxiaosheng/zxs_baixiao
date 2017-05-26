//
//  HeaderView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarVideoListHeaderView.h"

@implementation CarVideoListHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self z_setupViews];
    }
    return self;
}
-(void)z_setupViews
{
    self.myImageView=[[UIImageView alloc]init];
    //self.myImageView.backgroundColor=[UIColor redColor];
    self.myImageView.frame=self.bounds;
    self.myImageView.clipsToBounds=YES;
    self.myImageView.layer.cornerRadius=2;
    [self addSubview:self.myImageView];
    
    self.nameLabel=[[UILabel alloc]init];
   // self.nameLabel.backgroundColor=[UIColor grayColor];
    self.nameLabel.frame=CGRectMake(0, 0, CGRectGetWidth(self.myImageView.frame), 30);
    self.nameLabel.textColor=[UIColor grayColor];
//    self.nameLabel.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    [self.myImageView addSubview:self.nameLabel];

}
@end
