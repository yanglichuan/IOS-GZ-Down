//
//  ViewController.m
//  03-NSCache的演练
//
//  Created by apple on 15-1-17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSCacheDelegate>

// 缓存的容器
@property(nonatomic,strong)NSCache *myCache;

@end

@implementation ViewController

- (NSCache *)myCache
{
    if (_myCache == nil) {
        _myCache = [[NSCache alloc] init];
        
//        NSUInteger totalCostLimit;  "成本" 限制, 默认是 0 （没有限制）
//        图片 像素 ＝＝ 总的像素点
//        NSUInteger countLimit;  数量的限制  默认是 0
        // 设置缓存的对象，同时指定成本
//        - (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)g;
        
        // 设置数量的限制。 一旦超出限额，会自动删除之前添加的内容
        _myCache.countLimit = 30;
        
        // 代理
        _myCache.delegate = self;
    }
    return _myCache;
}

// MARK: delegate方法
// 缓存中的对象将要被删除，调用这个方法
// 一般开发测试使用
- (void)cache:(NSCache *)cache willEvictObject:(id)obj
{
    NSLog(@"要删除的对象obj---%@", obj);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (int i = 0; i < 100; i++) {
        // 向缓存中添加对象
        NSString *str = [NSString stringWithFormat:@"hello - %d", i];
        
        [self.myCache setObject:str forKey:@(i)];
//        @[];
//        @{}
    }
    
    for (int i = 0; i < 100; i++) {
        NSLog(@"%@", [self.myCache objectForKey:@(i)]);
    }
}


@end
