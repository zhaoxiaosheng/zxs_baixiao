//
//  CarConfigurationTableViewCell.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/12/29.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarConfigurationTableViewCell.h"

@implementation CarConfigurationTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self z_setupView];
    }
    return self;
}
-(void)z_setupView
{
    self.titleLeabel=[[UILabel alloc]init];
    //self.titleLeabel.backgroundColor=[UIColor redColor];
    self.titleLeabel.numberOfLines=0;
    self.titleLeabel.font=[UIFont systemFontOfSize:14];
    self.titleLeabel.textAlignment=NSTextAlignmentCenter;
    self.titleLeabel.layer.borderWidth=1;
    [self.contentView addSubview:self.titleLeabel];
    
    self.contentFirstLabel=[[UILabel alloc]init];
   // self.contentFirstLabel.backgroundColor=[UIColor blueColor];
    self.contentFirstLabel.numberOfLines=0;
    self.contentFirstLabel.font=[UIFont systemFontOfSize:14];
    self.contentFirstLabel.textAlignment=NSTextAlignmentCenter;
    self.contentFirstLabel.layer.borderWidth=1;
    [self.contentView addSubview:self.contentFirstLabel];
    
    self.contentSecondLabel=[[UILabel alloc]init];
   // self.contentSecondLabel.backgroundColor=[UIColor grayColor];
    self.contentSecondLabel.numberOfLines=0;
    self.contentSecondLabel.font=[UIFont systemFontOfSize:14];
    self.contentSecondLabel.textAlignment=NSTextAlignmentCenter;
    self.contentSecondLabel.layer.borderWidth=1;
    [self.contentView addSubview:self.contentSecondLabel];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLeabel.frame=CGRectMake(0,0 , CGRectGetWidth(self.contentView.frame)/5, CGRectGetHeight(self.contentView.frame));
    self.contentFirstLabel.frame=CGRectMake(CGRectGetMaxX(self.titleLeabel.frame), CGRectGetMinY(self.titleLeabel.frame), CGRectGetWidth(self.titleLeabel.frame)*2, CGRectGetHeight(self.titleLeabel.frame));
    self.contentSecondLabel.frame=CGRectMake(CGRectGetMaxX(self.contentFirstLabel.frame), CGRectGetMinY(self.contentFirstLabel.frame), CGRectGetWidth(self.contentFirstLabel.frame), CGRectGetHeight(self.contentFirstLabel.frame));
    
    

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
