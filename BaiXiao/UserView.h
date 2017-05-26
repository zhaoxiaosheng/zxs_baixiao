//
//  UserView.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/18.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserView : UIView
@property(strong,nonatomic)UIImageView *backgroudImageView;
@property(strong,nonatomic)UIImageView *myImageView;//头像
@property(strong,nonatomic)UILabel *nameLabel;//名字
@property(strong,nonatomic)UIButton *loginButton;//登陆
@property(strong,nonatomic)UIButton *logoutButton;//注销
@property(strong,nonatomic)UIButton *collectButton;//收藏
@property(strong,nonatomic)UIButton *setButton;//设置


@end
