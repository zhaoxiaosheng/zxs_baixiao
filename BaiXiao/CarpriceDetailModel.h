//
//  CarpriceDetailModel.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/14.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarpriceDetailModel : NSObject
@property(copy,nonatomic)NSString *id;//下页面ID
@property(copy,nonatomic)NSString *imgurl;//图片url
@property(copy,nonatomic)NSString *levelid;//
@property(copy,nonatomic)NSString *levelname;//车型
@property(copy,nonatomic)NSString *name;//车名
@property(copy,nonatomic)NSString *price;//价格

@end
