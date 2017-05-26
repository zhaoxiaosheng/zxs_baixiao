//
//  RegisterViewController.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/19.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PassValue)(NSString *userName, NSString *password);

@interface RegisterViewController : UIViewController

@property (nonatomic, copy) PassValue login;
@end
