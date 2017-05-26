//
//  CarDetailView.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/15.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CarTableView;
@interface CarDetailView : UIView
@property(nonatomic,strong)UIScrollView *scrollView;//页面ScrollView
@property(strong,nonatomic)UIImageView *myImageView;//汽车图片
@property(strong,nonatomic)UILabel *myInageViewLabel;//图片左下角的名字
@property(strong,nonatomic)UILabel *namelabel;//汽车名字
@property(strong,nonatomic)UILabel *priceLabel;//价格
@property(strong,nonatomic)UILabel *imageCountLabel;//图片数量
@property(strong,nonatomic)UIButton *button1;//配置
@property(strong,nonatomic)UIButton *button2;//视频
@property(strong,nonatomic)UIButton *button3;//口碑
@property(strong,nonatomic)UIButton *button4;//提车贴
@property(strong,nonatomic)UIButton *button5;//经销商
@property(strong,nonatomic)UIButton *button6;//降价
@property(strong,nonatomic)UIButton *button7;//评测
@property(strong,nonatomic)UIButton *button8;//行情
@property(strong,nonatomic)CarTableView *tableView;

@end
