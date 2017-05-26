//
//  CarListCollectionViewCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarListCollectionViewCell.h"

@implementation CarListCollectionViewCell
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
    self.myImageView.backgroundColor=[UIColor yellowColor];
    self.myImageView.frame=self.bounds;
    self.myImageView.clipsToBounds=YES;
    self.myImageView.layer.cornerRadius=10;
    [self.contentView addSubview:self.myImageView];

}
@end
