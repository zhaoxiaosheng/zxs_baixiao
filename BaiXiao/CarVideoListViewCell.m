//
//  CarVideoListViewCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarVideoListViewCell.h"

@implementation CarVideoListViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self z_setupViews];
    }
    return self;
}
-(void)z_setupViews
{
    self.myImageView=[[UIImageView alloc]init];
    //self.myImageView.backgroundColor=[UIColor redColor];
    self.myImageView.clipsToBounds=YES;
    self.myImageView.layer.cornerRadius=2;
    [self.contentView addSubview:self.myImageView];
    
    self.titleLabel=[[UILabel alloc]init];
   // self.titleLabel.backgroundColor=[UIColor greenColor];
    self.titleLabel.font=[UIFont systemFontOfSize:15];
    self.titleLabel.numberOfLines=0;
    [self.contentView addSubview:self.titleLabel];
    
    self.typeLabel=[[UILabel alloc]init];
    self.typeLabel.backgroundColor=[UIColor yellowColor];
    self.typeLabel.font=[UIFont systemFontOfSize:13];
    self.typeLabel.textColor=[UIColor whiteColor];
    [self.contentView addSubview:self.typeLabel];
    
    self.playImageView=[[UIImageView alloc]init];
    //self.playImageView.backgroundColor=[UIColor blueColor];
    [self.contentView addSubview:self.playImageView];
    
    self.playcount=[[UILabel alloc]init];
    //self.playcount.backgroundColor=[UIColor orangeColor];
    self.playcount.textColor=[UIColor grayColor];
    self.playcount.font=[UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.playcount];

}
-(void)layoutSubviews
{
    [super layoutSubviews];

    self.myImageView.frame=CGRectMake(5, 5, 130, CGRectGetHeight(self.contentView.frame)-10);
    
    self.titleLabel.frame=CGRectMake(CGRectGetMaxX(self.myImageView.frame)+5, CGRectGetMinY(self.myImageView.frame), CGRectGetWidth(self.contentView.frame)-CGRectGetWidth(self.myImageView.frame)-15, 50);
    
    self.typeLabel.frame=CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.myImageView.frame)-25, 35, 20);
    
    self.playImageView.frame=CGRectMake(CGRectGetMaxX(self.typeLabel.frame)+15, CGRectGetMidY(self.typeLabel.frame)-6, 20, 12);
    
    self.playcount.frame=CGRectMake(CGRectGetMaxX(self.playImageView.frame)+5, CGRectGetMinY(self.typeLabel.frame), 100, 20);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
