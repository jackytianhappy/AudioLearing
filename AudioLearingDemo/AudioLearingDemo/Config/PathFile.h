//
//  PathFile.h
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/14.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#ifndef PathFile_h
#define PathFile_h

//录制的声音 原
#define JRECORDER_FILE_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/JDemo.PCM"]

//左声道
#define JRECORDER_FILE_PATH_LEFT_PART [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/JDemo_Left.PCM"]

//右声道
#define JRECORDER_FILE_PATH_RIGHT_PART [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/JDemo_Right.PCM"]





#endif /* PathFile_h */
