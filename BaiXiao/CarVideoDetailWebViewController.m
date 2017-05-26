//
//  CarVideoDetailWebViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/17.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarVideoDetailWebViewController.h"
#import "CarVideoDetailWebView.h"
#import "UrlHeader.h"
@interface CarVideoDetailWebViewController ()<UIWebViewDelegate>
@property(strong,nonatomic)CarVideoDetailWebView *wv;
@end

@implementation CarVideoDetailWebViewController
-(void)loadView
{
    self.wv=[[CarVideoDetailWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view=self.wv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.wv.webView.delegate=self;
    [self z_makeData];
}
-(void)z_makeData
{
//NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@.html",kCarVideoDetailUrl,self.videoID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//    
//}];
//
    [self.wv.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@.html",kCarVideoDetailUrl,self.videoID]]]];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
