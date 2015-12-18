//
//  ViewController.m
//  09-联网状态的检测
//
//  Created by apple on 15-1-17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@property(nonatomic,strong)Reachability *reach;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 判断能否连接到某一个主机
    // http://www.baidu.com
    self.reach = [Reachability reachabilityWithHostName:@"baidu.com"];
    
    // 添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged) name:kReachabilityChangedNotification object:nil];
    
    // 开始监听
    [self.reach startNotifier];
}

- (void)dealloc
{
    // 停止监听
    [self.reach stopNotifier];
    
    // 移除监听 // 移除整个控制器里所有的监听
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    // 移除控制器里的kReachabilityChangedNotification监听
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

- (void)reachabilityChanged
{
    // 状态
    switch (self.reach.currentReachabilityStatus) {
        case NotReachable:
            NSLog(@"没有连接");
            break;
        case ReachableViaWiFi:
            NSLog(@"不用花钱");
            break;
        case ReachableViaWWAN:
            NSLog(@"要流量");
            break;
            
        default:
            NSLog(@"。。。。。。");
            
            break;
    }
}

@end
