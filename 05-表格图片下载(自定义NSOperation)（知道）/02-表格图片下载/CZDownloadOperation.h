//
//  CZDownloadOperation.h
//  02-表格图片下载
//
//  Created by apple on 15-1-17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CZDownloadOperation : NSOperation

/**要下载图片的url*/
@property(nonatomic,copy)NSString *urlString;

@end
