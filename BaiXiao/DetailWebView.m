//
//  DetailWebView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/13.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "DetailWebView.h"

@implementation DetailWebView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_setupViews];
    }
    return self;
}

-(void)p_setupViews
{
    self.webView=[[UIWebView alloc]init];
    self.webView.frame=CGRectMake(0, CGRectGetMinY(self.bounds)-89, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)+89 );
    [self addSubview:self.webView];
}

@end
