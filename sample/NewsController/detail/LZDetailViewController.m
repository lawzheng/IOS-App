//
//  LZDetailViewController.m
//  sample
//
//  Created by LYCK on 2020/5/30.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZDetailViewController.h"
#import <WebKit/WebKit.h>
#import "LZScreen.h"

@interface LZDetailViewController ()<WKNavigationDelegate>
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, copy, readwrite) NSString *articleUrl;

@end

@implementation LZDetailViewController
// 移除观察事件
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (instancetype)initWithUrlString:(NSString *)urlString{
    self = [super self];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - STATUSBARHEIGHT - 44)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    // 进度条
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        self.progressView.progressTintColor = [UIColor greenColor];
        self.progressView;
    })];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 决定是否是否加载
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

// 加载结束
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"xx");
}

// 注册观察事件 进度
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    self.progressView.progress = self.webView.estimatedProgress;
    if (self.progressView.progress == 1) {
        self.progressView.progressTintColor = [UIColor whiteColor];
    }
}

@end
