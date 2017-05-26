//
//  HeadView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/14.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "HeadView.h"

#define ViewW self.frame.size.width
#define ViewH self.frame.size.height
@implementation HeadView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        

        [self z_setupViews];
    }
    
    return self;
}
-(void)z_setupViews
{
    /**数组*/
    self.AllArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSString *string = [NSString stringWithFormat:@"car%d.jpg",i];
        [self.AllArray addObject:string];
    }
    /**设置ScrollView*/
    [self SetScrollView];
    /**设置ImageView*/
    [self setImageView];
    /**设置PageControl*/
    [self setPageControl];
    /**Timer*/
    self.Timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(Run) userInfo:nil repeats:YES];
}
/**PageControl*/
- (void)setPageControl {
    
    /**设置PageControl*/
    self.PageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(230, ViewH * 0.95, ViewW - 200, ViewH * 0.05)];
    /**显示有多少页*/
    self.PageControl.numberOfPages = self.AllArray.count;
    /**所在位置颜色*/
    self.PageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.627 green:0.407 blue:0.133 alpha:1];
    /**圆点颜色*/
    self.PageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.9 alpha:0.8];
    //  self.PageControl.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.PageControl];
}
/**ScrollView*/
- (void)SetScrollView {
    
    self.ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ViewW, ViewH)];
    self.ScrollView.bounces = YES;
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.delegate = self;
    self.ScrollView.showsHorizontalScrollIndicator = YES;
    self.ScrollView.contentSize = CGSizeMake(ViewW * (self.AllArray.count + 2), ViewH);
    [self addSubview:self.ScrollView];
    
    
}
/**ImageView*/
- (void)setImageView {
    
    /**循环布局ImageView*/
    for (int i = 0; i < self.AllArray.count + 2; i++) {
        if (i == 0) {
            
            self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * ViewW, 0, ViewW, ViewH)];
            /**循环打开交互*/
            self.ImageView.userInteractionEnabled = YES;
            /**添加轻拍手势*/
            [self.ImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapAction:)]];
            self.ImageView.image = [UIImage imageNamed:self.AllArray.lastObject];
            
            [self.ScrollView addSubview:self.ImageView];
        } else if (i == self.AllArray.count + 1) {
            
            self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * ViewW, 0, ViewW, ViewH)];
            /**循环打开交互*/
            self.ImageView.userInteractionEnabled = YES;
            /**添加轻拍手势*/
            [self.ImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapAction:)]];
            self.ImageView.image = [UIImage imageNamed:self.AllArray.firstObject];
            
            [self.ScrollView addSubview:self.ImageView];
            
        } else {
            
            self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * ViewW, 0, ViewW, ViewH)];
            /**循环打开交互*/
            self.ImageView.userInteractionEnabled = YES;
            /**添加轻拍手势*/
            [self.ImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapAction:)]];
            self.ImageView.image = [UIImage imageNamed:self.AllArray[i - 1]];
            
            [self.ScrollView addSubview:self.ImageView];
        }
    }
}
/**轮播图响应方法*/
- (void)TapAction:(UITapGestureRecognizer *)sender {
    NSLog(@"111111");
}

#pragma mark - 定时器响应方法
/**定时器响应方法*/
static int i = 1;
- (void)Run {
    self.ScrollView.contentOffset = CGPointMake(ViewW * (++i % (self.AllArray.count) + 1), 0);
}

#pragma mark - 设置ScrollView循环滑动
/**ScrollView滑动,必走方法*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    /**关闭定时器*/
    [self.Timer invalidate];
    /**从新开启定时器*/
    self.Timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(Run) userInfo:nil repeats:YES];
    
    /**如果显示第一张*/
    if (self.ScrollView.contentOffset.x == 0) {
        /**显示数据中最后一张*/
        self.ScrollView.contentOffset = CGPointMake((self.AllArray.count) * ViewW, 0);
        i = (int)self.AllArray.count - 1;
        /**如果显示最后一张*/
    } else if (self.ScrollView.contentOffset.x == (self.AllArray.count + 1) * ViewW) {
        /**显示数据第一张*/
        self.ScrollView.contentOffset = CGPointMake(ViewW, 0);
        i = 1;
    }
    /**设置小点显示在那个位置*/
    self.PageControl.currentPage = (NSInteger)(self.ScrollView.contentOffset.x / ViewW) - 1;
    i = (int)self.PageControl.currentPage;
}

@end
