//
//  HeadView.h
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/14.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView<UIScrollViewDelegate>
/**ScrollView*/
@property (nonatomic, strong) UIScrollView *ScrollView;
/**ImageView*/
@property (nonatomic, strong) UIImageView *ImageView;
/**PageControl*/
@property (nonatomic, strong) UIPageControl *PageControl;
/**Timer*/
@property (nonatomic, strong) NSTimer *Timer;
/**数组*/
@property (nonatomic, strong) NSMutableArray *AllArray;
@end
