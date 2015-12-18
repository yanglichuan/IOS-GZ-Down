//
//  ViewController.m
//  08-位移枚举
//
//  Created by apple on 15-1-17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

typedef enum
{
    CZActionTypeTop = 1 << 0,
    CZActionTypeBottom = 1 << 1,
    CZActionTypeLeft = 1 << 2,
    CZActionTypeRight = 1 << 3,
}CZActionType;

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

//    [self test:CZActionTypeTop];
    // 传多个选项
//    [self test:CZActionTypeTop | CZActionTypeBottom | CZActionTypeLeft | CZActionTypeRight];
    
    // 一般传0，意味着什么操作都不做
    [self test:0];
}

- (void)test:(CZActionType)type
{
    NSLog(@"type = %d",type);
    
    if (type & CZActionTypeTop) {
        NSLog(@"上");
    }
    if (type & CZActionTypeBottom) {
        NSLog(@"下");
    }
    if (type & CZActionTypeLeft) {
        NSLog(@"左");
    }
    if (type & CZActionTypeRight) {
        NSLog(@"右");
    }
}

@end
