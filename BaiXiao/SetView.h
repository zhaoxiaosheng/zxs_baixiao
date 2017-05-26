//
//  SetView.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetView : UIView
@property(strong,nonatomic)UIImageView *myImageView;//头像

@property(strong,nonatomic)UILabel *prompt;//提示

@property(strong,nonatomic)UITextField *nameText;//名字

@property(strong,nonatomic)UIButton *submitButton;//提交

@property(strong,nonatomic)UIButton *cancelButton;//取消
@end
