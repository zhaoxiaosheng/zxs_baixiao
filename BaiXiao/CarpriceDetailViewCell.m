//
//  CarpriceDetailViewCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/14.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarpriceDetailViewCell.h"

@implementation CarpriceDetailViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupViews];
    }
    return self;
}
-(void)p_setupViews
{
    self.myImageView=[[UIImageView alloc]init];
    //self.myImageView.backgroundColor=[UIColor redColor];
    self.myImageView.clipsToBounds=YES;
    self.myImageView.layer.cornerRadius=3;
    [self.contentView addSubview:self.myImageView];
    
    self.nameLabel=[[UILabel alloc]init];
    //self.nameLabel.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.nameLabel];
    
    self.levelnameLabel=[[UILabel alloc]init];
    //self.levelnameLabel.backgroundColor=[UIColor yellowColor];
    self.levelnameLabel.font=[UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:self.levelnameLabel];
    
    self.priceLabel=[[UILabel alloc]init];
    //self.priceLabel.backgroundColor=[UIColor blueColor];
    self.priceLabel.font=[UIFont systemFontOfSize:13];
    self.priceLabel.textColor=[UIColor redColor];
    [self.contentView addSubview:self.priceLabel];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.myImageView.frame=CGRectMake(5, 5, 130, CGRectGetHeight(self.contentView.frame)-10);

    self.nameLabel.frame=CGRectMake(CGRectGetMaxX(self.myImageView.frame)+10, CGRectGetMinY(self.myImageView.frame), 130, 60);
    self.levelnameLabel.frame=CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame)+5, 110, 30);
    self.priceLabel.frame=CGRectMake(CGRectGetMaxX(self.levelnameLabel.frame)+5, CGRectGetMinY(self.levelnameLabel.frame), 110, 30);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
