//
//  WMWebViewController.m
//  Watermelon
//
//  Created by jilei on 17/3/1.
//  Copyright © 2017年 kyson. All rights reserved.
//

#import "WMWebViewController.h"
#import <WebKit/WebKit.h>
@interface WMWebViewController ()<WKNavigationDelegate,WKUIDelegate,UIWebViewDelegate>

@end

@implementation WMWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate=self;
    [self.view addSubview:webView];

    if ([self.url hasPrefix:@"file"]) {
        
        NSString *fileName = [self.url stringByReplacingOccurrencesOfString:@"file:///" withString:@""];
        fileName = [fileName stringByReplacingOccurrencesOfString:@".html" withString:@""];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"html"];
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
        [webView loadRequest:request];//加载

    }else{
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
        [webView loadRequest:request];
    }
    
    // Do any additional setup after loading the view.
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



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}



@end
