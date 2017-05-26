//
//  QuotationListCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/11.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "QuotationListCell.h"

@implementation QuotationListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}
-(void)setupViews
{
    self.myImageView=[[UIImageView alloc]init];
    //self.myImageView.backgroundColor=[UIColor yellowColor];
    self.myImageView.layer.cornerRadius=2;
    [self.contentView addSubview:self.myImageView];
    
    self.namelabel=[[UILabel alloc]init];
    //self.namelabel.backgroundColor=[UIColor greenColor];
    self.namelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
    [self.contentView addSubview:self.namelabel];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.myImageView.frame=CGRectMake(30, CGRectGetHeight(self.contentView.frame)/2-30, 120, 60);
    
    self.namelabel.frame=CGRectMake(CGRectGetMaxX(self.myImageView.frame)+20, CGRectGetMinY(self.myImageView.frame)+5, 150, 50);
    
}
@end
