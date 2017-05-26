//
//  QutationDetailViewCell.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/12.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QutationDetailViewCell : UITableViewCell
@property(strong,nonatomic)UIImageView *MyImageView;//详情图片
@property(strong,nonatomic)UILabel *nameLabel;//商品名字
@property(strong,nonatomic)UILabel *priceLabel;//价格
@property(strong,nonatomic)UILabel *reviewLabel;//评论人数
@end
