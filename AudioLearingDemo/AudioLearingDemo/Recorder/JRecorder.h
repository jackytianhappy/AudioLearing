//
//  JRecorder.h
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/14.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRecorder : NSObject

+ (instancetype)sharedInstace;

- (void)startRecord;

- (void)stopRecord;

- (void)playSound;

@end
