//
//  CarpriceViewCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/14.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarpriceViewCell.h"

@implementation CarpriceViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupViews];
    }
    return self;
}
-(void)p_setupViews
{
    self.myImageView=[[UIImageView alloc]init];
    //self.myImageView.backgroundColor=[UIColor redColor];
    
    [self.contentView addSubview:self.myImageView];
    
    self.nameLabel=[[UILabel alloc]init];
    //self.nameLabel.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:self.nameLabel];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.myImageView.frame=CGRectMake(20, 5, 70, CGRectGetHeight(self.contentView.frame)-10);
    self.nameLabel.frame=CGRectMake(CGRectGetMaxX(self.myImageView.frame)+30,CGRectGetMinY(self.myImageView.frame) , 100, 60);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
