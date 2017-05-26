//
//  CarDetailView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/15.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#define kColor [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]
#define kImageX ([UIScreen mainScreen].bounds.size.width/2)-60
#import "CarDetailView.h"
@interface CarDetailView ()
@property(strong,nonatomic)UISegmentedControl *segmentedControl;



@end

@implementation CarDetailView
-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame ]) {
        [self p_setupViews];
    }
    return self;
}
-(void)p_setupViews
{
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, -17, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)+15)];
    self.scrollView.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.scrollView];
    
    self.myImageView=[[UIImageView alloc]init];
   // self.myImageView.backgroundColor=[UIColor greenColor];
    self.myImageView.frame=CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), 280);
    
    [self.scrollView addSubview:self.myImageView];
    
    self.myInageViewLabel=[[UILabel alloc]init];
   // self.myInageViewLabel.backgroundColor=[UIColor yellowColor];
    self.myInageViewLabel.frame= CGRectMake(5, CGRectGetMaxY(self.myImageView.frame)-47, 150, 30);
    self.myInageViewLabel.font=[UIFont systemFontOfSize:13];
    self.myInageViewLabel.textColor=[UIColor whiteColor];
    [self.myImageView addSubview:self.myInageViewLabel];
    
    self.imageCountLabel=[[UILabel alloc]init];
   // self.imageCountLabel.backgroundColor=[UIColor yellowColor];
    self.imageCountLabel.frame=CGRectMake(CGRectGetMaxX(self.myImageView.frame)-155, CGRectGetMinY(self.myInageViewLabel.frame), 150, 30);
    self.imageCountLabel.textAlignment=NSTextAlignmentRight;
    self.imageCountLabel.font=[UIFont systemFontOfSize:13];
    self.imageCountLabel.textColor=[UIColor whiteColor];
    [self.myImageView addSubview:self.imageCountLabel];
    
    self.namelabel=[[UILabel alloc]init];
    self.namelabel.backgroundColor=kColor;
    self.namelabel.frame=CGRectMake(0, CGRectGetMaxY(self.myInageViewLabel.frame), CGRectGetWidth(self.frame), 30);
    [self.scrollView addSubview:self.namelabel];
    
    self.priceLabel=[[UILabel alloc]init];
    self.priceLabel.backgroundColor=kColor;
    self.priceLabel.frame=CGRectMake(0, CGRectGetMaxY(self.namelabel.frame), CGRectGetWidth(self.frame), 30);
    self.priceLabel.textColor=[UIColor redColor];
    [self.scrollView addSubview:self.priceLabel];
    
    
    self.button1=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button1.backgroundColor=kColor;
    self.button1.frame=CGRectMake(1, CGRectGetMaxY(self.priceLabel.frame)+5, ((CGRectGetWidth(self.scrollView.frame)-3)/2), 60);
    [self.button1 setTitle:@"配置" forState:(UIControlStateNormal)];
    [self.button1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button1];
    
    UIImageView *button1imageView=[[UIImageView alloc]init];
   // button1imageView.backgroundColor=[UIColor redColor];
    button1imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button1.frame)-30, CGRectGetHeight(self.button1.frame)-30);
    button1imageView.image=[UIImage imageNamed:@"carshezhi"];
    [self.button1 addSubview:button1imageView];
    
    self.button2=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button2.backgroundColor=kColor;
    self.button2.frame=CGRectMake(CGRectGetMaxX(self.button1.frame)+1, CGRectGetMinY(self.button1.frame), CGRectGetWidth(self.button1.frame), CGRectGetHeight(self.button1.frame));
    [self.button2 setTitle:@"视频" forState:(UIControlStateNormal)];
    [self.button2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button2];
    
    UIImageView *button2imageView=[[UIImageView alloc]init];
   // button2imageView.backgroundColor=[UIColor redColor];
    button2imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button2.frame)-30, CGRectGetHeight(self.button2.frame)-30);
    button2imageView.image=[UIImage imageNamed:@"carshiping"];
    [self.button2 addSubview:button2imageView];
    
    self.button3=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button3.backgroundColor=kColor;
    self.button3.frame=CGRectMake(CGRectGetMinX(self.button1.frame), CGRectGetMaxY(self.button2.frame)+1, CGRectGetWidth(self.button2.frame), CGRectGetHeight(self.button2.frame));
    [self.button3 setTitle:@"口碑" forState:(UIControlStateNormal)];
    [self.button3 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button3];
    
    
    UIImageView *button3imageView=[[UIImageView alloc]init];
   // button3imageView.backgroundColor=[UIColor redColor];
    button3imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button3.frame)-30, CGRectGetHeight(self.button3.frame)-30);
    button3imageView.image=[UIImage imageNamed:@"carkoubei"];
    [self.button3 addSubview:button3imageView];
    
    self.button4=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button4.backgroundColor=kColor;
    self.button4.frame=CGRectMake(CGRectGetMaxX(self.button3.frame)+1, CGRectGetMinY(self.button3.frame), CGRectGetWidth(self.button3.frame), CGRectGetHeight(self.button3.frame));
    [self.button4 setTitle:@"提车贴" forState:(UIControlStateNormal)];
    [self.button4 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button4];
    
    
    UIImageView *button4imageView=[[UIImageView alloc]init];
   // button4imageView.backgroundColor=[UIColor redColor];
    button4imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button4.frame)-30, CGRectGetHeight(self.button4.frame)-30);
    button4imageView.image=[UIImage imageNamed:@"cartichetie"];
    [self.button4 addSubview:button4imageView];
    
    
    self.button5=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button5.backgroundColor=kColor;
    self.button5.frame=CGRectMake(CGRectGetMinX(self.button3.frame), CGRectGetMaxY(self.button4.frame)+1, CGRectGetWidth(self.button1.frame), CGRectGetHeight(self.button1.frame));
    [self.button5 setTitle:@"经销商" forState:(UIControlStateNormal)];
    [self.button5 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button5];
    
    UIImageView *button5imageView=[[UIImageView alloc]init];
    //button5imageView.backgroundColor=[UIColor redColor];
    button5imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button5.frame)-30, CGRectGetHeight(self.button5.frame)-30);
    button5imageView.image=[UIImage imageNamed:@"carjingxiaoshang"];
    [self.button5 addSubview:button5imageView];
    
    self.button6=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button6.backgroundColor=kColor;
    self.button6.frame=CGRectMake(CGRectGetMaxX(self.button5.frame)+1, CGRectGetMinY(self.button5.frame), CGRectGetWidth(self.button5.frame), CGRectGetHeight(self.button5.frame));
    [self.button6 setTitle:@"降价" forState:(UIControlStateNormal)];
    [self.button6 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button6];
    
    
    
    UIImageView *button6imageView=[[UIImageView alloc]init];
    //button6imageView.backgroundColor=[UIColor redColor];
    button6imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button6.frame)-30, CGRectGetHeight(self.button6.frame)-30);
    button6imageView.image=[UIImage imageNamed:@"carjiangjia"];
    [self.button6 addSubview:button6imageView];
    
    self.button7=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button7.backgroundColor=kColor;
    self.button7.frame=CGRectMake(CGRectGetMinX(self.button5.frame), CGRectGetMaxY(self.button6.frame)+1, CGRectGetWidth(self.button6.frame), CGRectGetHeight(self.button6.frame));
    [self.button7 setTitle:@"评测" forState:(UIControlStateNormal)];
    [self.button7 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button7];
    
    
    UIImageView *button7imageView=[[UIImageView alloc]init];
   // button7imageView.backgroundColor=[UIColor redColor];
    button7imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button7.frame)-30, CGRectGetHeight(self.button7.frame)-30);
    button7imageView.image=[UIImage imageNamed:@"carpingce"];
    [self.button7 addSubview:button7imageView];
    
    self.button8=[UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button8.backgroundColor=kColor;
    self.button8.frame=CGRectMake(CGRectGetMaxX(self.button7.frame)+1, CGRectGetMinY(self.button7.frame), CGRectGetWidth(self.button7.frame), CGRectGetHeight(self.button7.frame));
    [self.button8 setTitle:@"行情" forState:(UIControlStateNormal)];
    [self.button8 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.scrollView addSubview:self.button8];
    
    UIImageView *button8imageView=[[UIImageView alloc]init];
   // button8imageView.backgroundColor=[UIColor redColor];
    button8imageView.frame=CGRectMake(40, 15, CGRectGetHeight(self.button8.frame)-30, CGRectGetHeight(self.button8.frame)-30);
    button8imageView.image=[UIImage imageNamed:@"carhangqing"];
    [self.button8 addSubview:button8imageView];
    
    

    
}

@end
