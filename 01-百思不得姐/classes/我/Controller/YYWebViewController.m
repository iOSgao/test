//
//  YYWebViewController.m
//  01-百思不得姐
//
//  Created by Apple on 15/10/11.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "YYWebViewController.h"

@interface YYWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refresh;

@end

@implementation YYWebViewController
- (IBAction)back:(id)sender {
    [self.webView goBack];
}
- (IBAction)forward:(id)sender {
    [self.webView goForward];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.back.enabled = webView.canGoBack;
    self.forward.enabled = webView.canGoForward;
}

@end
