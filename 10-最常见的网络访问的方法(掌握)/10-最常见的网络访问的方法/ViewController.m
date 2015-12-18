//
//  ViewController.m
//  10-最常见的网络访问的方法
//
//  Created by apple on 15-1-17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 确定一个要访问的资源 m.jd.com
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    
    // 2. 建立请求, 准备告诉服务器端，我们客户端需要的资源
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 告诉服务器一些附加信息，我的手机是iPhone，请给我返回iPhone对应的网页
    [request setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko)" forHTTPHeaderField:@"User-Agent"];
    
    // 3. 把请求发送给服务器，等服务器处理完成后，返回数据(结果)
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 服务器的相应的数据返回后，会调用这块代码
//        NSLog(@"%@---%@", data, [NSThread currentThread]);
        
        [data writeToFile:@"/Users/apple/Desktop/123" atomically:YES];
        
        // 编码 NSUTF8StringEncoding
        NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"html = %@", html);
        
        [self.webView loadHTMLString:html baseURL:nil];
        
    }];

}


@end
