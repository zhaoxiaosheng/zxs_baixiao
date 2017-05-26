//
//  Quotation.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/12.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Quotation : NSObject
@property(copy,nonatomic)NSString *id;//ID
@property(copy,nonatomic)NSString *name;//产品名字
@property(copy,nonatomic)NSString *manuId;//
@property(copy,nonatomic)NSString *mark;//货币标识
@property(copy,nonatomic)NSString *price;//价格
@property(copy,nonatomic)NSString *pic;//产品图片URL
@property(copy,nonatomic)NSString *reviewNum;//评价数

@end
