//
//  CZDownloadOperation.m
//  02-表格图片下载
//
//  Created by apple on 15-1-17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CZDownloadOperation.h"

@implementation CZDownloadOperation

// 注意点：需要自己手动添加自动释放池
// 自定义的操作，可以取消
- (void)main
{
    @autoreleasepool {
  
        // 如果操作在队列里，还没有调度，就直接return
        if (self.isCancelled) return;
        
        NSLog(@"正在下载中......");
        // 1. 下载图片(二进制)
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlString]];
        
        if (self.isCancelled) return;

        // 将图片写入沙盒
        [data writeToFile:[self cachePathWithUrl:self.urlString] atomically:YES];
    }
}

/**
 拼接一个文件在沙盒的全路径
 */
- (NSString *)cachePathWithUrl:(NSString *)urlStr
{
    // 1. 获得缓存的路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    
    // 2. 把路径跟urlStr拼接起来
    //    http://p17.qhimg.com/dr/48_48_/t01077fd80ffb5c8740.png
    return [cachePath stringByAppendingPathComponent:urlStr.lastPathComponent];
}

@end
