//
//  ViewController.m
//  02-表格图片下载
//
//  Created by apple on 15-1-16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CZApp.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

// plist文件数据的容器
@property(nonatomic,strong)NSArray *appList;

@end

@implementation ViewController

// 懒加载
- (NSArray *)appList
{
    if (_appList == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        
        // 字典转模型
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            CZApp *app = [CZApp appWithDict:dict];
            [arrayM addObject:app];
        }
        _appList = arrayM;
    }
    return _appList;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appList.count;
}

/**
 问题1: 如果网络比较慢，会比较卡
 解决办法：用异步下载
 */
// cell里面的imageView子控件也是懒加载。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"AppCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 给cell设置数据
    CZApp *app = self.appList[indexPath.row];
    
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    // 显示图片
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];
    
    
    
   
    
    // 另外下载图像的方法
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"user_default"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // receivedSize 已经接受到的大小
        // expectedSize 期望的大小，总大小
        float progress = (float)receivedSize/expectedSize;
        NSLog(@"下载进度 %f", progress);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        NSLog(@"%@", [NSThread currentThread]);
    }];
    
    
    return cell;
}






@end
