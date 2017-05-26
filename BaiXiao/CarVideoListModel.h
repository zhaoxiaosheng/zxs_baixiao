//
//  CarVideoListModel.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarVideoListModel : NSObject
@property(copy,nonatomic)NSString *id;//
@property(copy,nonatomic)NSString *largepic;//大图片Url
@property(copy,nonatomic)NSString *playcount;//评论人数
@property(copy,nonatomic)NSString *shorttitle;//
@property(copy,nonatomic)NSString *smallpic;//小图片Url
@property(copy,nonatomic)NSString *title;//标题
@property(copy,nonatomic)NSString *type;//类型
@property(copy,nonatomic)NSString *videoid;//视频ID


@end
