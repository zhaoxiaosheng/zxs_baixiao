//
//  CollectHelpers.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/24.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CollectHelpers.h"

@implementation CollectHelpers
+ (CollectHelpers *)defaultHelpers
{
    static dispatch_once_t onceToken;
    static CollectHelpers * collectHelpers = nil;
    dispatch_once(&onceToken, ^{
        collectHelpers = [CollectHelpers new];
        
    });
    return collectHelpers;
}

//-(void)searchLike
//{
//    self.dataArray = [NSMutableArray array];
//    AVUser * user = [AVUser currentUser];
//    AVQuery * query = [AVQuery queryWithClassName:@"Like"];
//    [query whereKey:@"UserId" equalTo:user.objectId];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            for (AVObject * object in objects) {
//                NSData * data = [object valueForKey:@"news"];
//                News * news = [[FileHandle defaultFile] unarchiverObject:data forkey:@"news"];
//                //NSLog(@"%@", news.title);
//                [self.dataArray addObject:news];
//            }
//            
//        }else{
//            NSLog(@"---错误");
//        }
//        //回到主线程发送通知
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"finishLike" object:nil];
//        });
//    }];
//
//}
@end
