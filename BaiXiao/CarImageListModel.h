//
//  CarImageListModel.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarImageListModel : NSObject
@property(copy,nonatomic)NSString *id;//id
@property(copy,nonatomic)NSString *smallpic;//图片URL
@property(copy,nonatomic)NSString *specid;//
@property(copy,nonatomic)NSString *specname;//车名
@property(copy,nonatomic)NSString *rowcount;//图片张数
@end
