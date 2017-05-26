//
//  CarImageListModel.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarImageListModel.h"

@implementation CarImageListModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"rowcount"]) {
        self.rowcount=value;
    }
}
@end
