//
//  JRecorder.m
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/14.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#import "JRecorder.h"
static JRecorder *_instance;

@interface JRecorder(){
    
}

@end

@implementation JRecorder
+ (instancetype)sharedInstace{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (self) {
            _instance = [[JRecorder alloc] init];
        }
    });
    
    return _instance;
}

- (void)startRecord{
    
}

@end
