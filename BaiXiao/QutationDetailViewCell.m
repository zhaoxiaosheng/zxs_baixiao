//
//  QutationDetailViewCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/12.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "QutationDetailViewCell.h"

@implementation QutationDetailViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupViews];
    }
    return self;
}
-(void)p_setupViews
{
    self.MyImageView=[[UIImageView alloc]init];
    //self.MyImageView.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:self.MyImageView];
    
    self.nameLabel=[[UILabel alloc]init];
    //self.nameLabel.backgroundColor=[UIColor greenColor];
    self.nameLabel.font=[UIFont systemFontOfSize:15];
    self.nameLabel.numberOfLines=0;
    [self.contentView addSubview:self.nameLabel];
    
    self.priceLabel=[[UILabel alloc]init];
    //self.priceLabel.backgroundColor=[UIColor yellowColor];
    self.priceLabel.textColor=[UIColor redColor];
    [self.contentView addSubview:self.priceLabel];
    
    self.reviewLabel=[[UILabel alloc]init];
    //self.reviewLabel.backgroundColor=[UIColor blueColor];
    self.reviewLabel.font=[UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.reviewLabel];
    

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.MyImageView.frame=CGRectMake(10, 10, 100, 70);
    
    self.nameLabel.frame=CGRectMake(CGRectGetMaxX(self.MyImageView.frame)+10, CGRectGetMinY(self.MyImageView.frame), 170, 40);
    self.priceLabel.frame=CGRectMake(CGRectGetMaxX(self.nameLabel.frame)+5, CGRectGetMaxY(self.nameLabel.frame)-20, 70, 30);
    
    self.reviewLabel.frame=CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.MyImageView.frame)-30, 170, 30);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
