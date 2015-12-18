//
//  ViewController.m
//  07-渐进式下载效果
//
//  Created by apple on 15-1-17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    [self.imageView setImage:[UIImage imageNamed:@"bd698b0fjw1e0ph8unyg6g.gif"]];
    
    [self.imageView sd_setImageWithURL:[[NSBundle mainBundle] URLForResource:@"bd698b0fjw1e0ph8unyg6g.gif" withExtension:nil]];
}

- (void)test
{
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://c.hiphotos.baidu.com/image/pic/item/9a504fc2d56285351fc06c2092ef76c6a7ef638b.jpg"] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

@end
