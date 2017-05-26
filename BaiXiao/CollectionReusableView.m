//
//  CollectionReusableView.m
//  BaiXiao
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CollectionReusableView.h"

@implementation CollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
        [self addTimer];
    }
    return self;
}
-(void)p_setupView
{
    self.imageNameArray = [NSMutableArray array];
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    UIImageView *firstView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    firstView.image=[UIImage imageNamed:@"4.jpg"];
    [self.scrollView addSubview:firstView];
    
    for (int i = 0; i < 5; i ++) {
        NSString * temp = [NSString stringWithFormat:@"%d.jpg",i];
        [self.imageNameArray addObject:temp];
        UIImageView * picture = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageNameArray[i]]];
        picture.frame = CGRectMake((i+1) * CGRectGetWidth(self.scrollView.frame), CGRectGetMinY(self.scrollView.frame), CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        [self.scrollView addSubview:picture];
    }
    [self addSubview:self.scrollView];
    
    UIImageView *lastView=[[UIImageView alloc]initWithFrame:CGRectMake(6*self.scrollView.frame.size.width, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    lastView.image=[UIImage imageNamed:@"0.jpg"];
    [self.scrollView addSubview:lastView];
    self.scrollView.pagingEnabled = YES; // 整页显示
    self.scrollView.showsHorizontalScrollIndicator = NO; // 水平滚动条不显示
    self.scrollView.contentSize = CGSizeMake(7 * self.scrollView.frame.size.width,0);
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.scrollView.frame) - 100, CGRectGetMaxY(self.scrollView.frame) - 20, 80, 20)];
    self.pageControl.numberOfPages = 5 ; // 总页数
    self.pageControl.currentPage = 0; // 设置当前页
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    [self addSubview:self.pageControl];
    
    
    [self.pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    self.scrollView.delegate = self;
    
    
    
    
}
- (void)timerAction{
    
    static int i = 0;
    i++;
    
    if (i == self.imageNameArray.count) {
        i=0;
        
    }
    
    
    [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.scrollView.frame) * i, 0)];
    self.pageControl.currentPage = i;
    
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self endTimer];
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    [self addTimer];
    
}
-(void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES ];
    
}
-(void)endTimer
{
    [self.timer invalidate];
    
}
- (void)pageAction:(UIPageControl *)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset = CGPointMake(sender.currentPage * self.scrollView.frame.size.width, 0);
    }];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    
    if (scrollView == self.scrollView) {
        
        
        if (self.scrollView.contentOffset.x == (self.scrollView.frame.size.width * 6)) {
            
            self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.frame), 0);
            
        }else if (self.scrollView.contentOffset.x == 0){
            
            self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.frame) * 5, 0);
            
        }
        // 计算当前页
        self.pageControl.currentPage = self.scrollView.contentOffset.x / self.scrollView.frame.size.width - 1;
                _currentIndex = self.pageControl.currentPage;
        
        
    }
}

@end
