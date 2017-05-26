//
//  DetailViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/13.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailWebView.h"
#import "UrlHeader.h"
@interface DetailViewController ()<UIWebViewDelegate>
@property(strong,nonatomic)DetailWebView *dv;
//@property(strong,nonatomic)NSString *url;
@end

@implementation DetailViewController
-(void)loadView
{
    self.dv=[[DetailWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.dv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.name;
    
    self.dv.webView.delegate=self;
    
    [self p_markData];
  
}
-(void)p_markData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession ]dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kWebViewUrl,self.webID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (data !=nil) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        [self.dv.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:dic[@"wap_url"]]]];
    
    }
}];
    [task resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
