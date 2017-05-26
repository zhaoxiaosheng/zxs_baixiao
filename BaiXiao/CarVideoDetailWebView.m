//
//  CarVideoDetailWebView.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/17.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarVideoDetailWebView.h"

@implementation CarVideoDetailWebView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self z_setupViews];
    }
    return self;
}
-(void)z_setupViews
{
    self.webView=[[UIWebView alloc]init];
    self.webView.frame=self.bounds;
    //self.webView.backgroundColor=[UIColor redColor];
    [self addSubview:self.webView];

}
@end
