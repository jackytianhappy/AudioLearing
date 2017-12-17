//
//  JRecorder.m
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/14.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#import "JRecorder.h"
#import <AVFoundation/AVFoundation.h>
#import "PathFile.h"

static JRecorder *_instance;

@interface JRecorder()<AVAudioRecorderDelegate>{
    
}

@property (nonatomic, strong) AVAudioRecorder *recorder;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation JRecorder
+ (instancetype)sharedInstace{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (self) {
            _instance = [[JRecorder alloc] init];
            
            // 创建音频会话
            AVAudioSession *audioSession=[AVAudioSession sharedInstance];
            // 设置录音类别（这里选用录音后可回放录音类型）
            [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
            [audioSession setActive:YES error:nil];
            
        }
    });
    
    return _instance;
}

- (void)startRecord{
    [self deleteRecord];
    [self.recorder prepareToRecord];
    [self.recorder record];
}

- (void)stopRecord{
    [self.recorder pause];
    [self.recorder stop];
}

- (void)playSound{
    // 没有文件不播放
    if (![[NSFileManager defaultManager] fileExistsAtPath:JRECORDER_FILE_PATH]){
        NSLog(@"没文件");
    }else{
        NSLog(@"有文件");
        [self.audioPlayer play];
    }
}

-(void)deleteRecord{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    if ([[NSFileManager defaultManager] fileExistsAtPath:JRECORDER_FILE_PATH]) {
        // 文件已经存在
        if ([fileManager removeItemAtPath:JRECORDER_FILE_PATH error:nil]) {
            NSLog(@"删除成功");
        }else {
            NSLog(@"删除失败");
        }
    }else {
        return; // 文件不存在无需删除
    }
}




#pragma mark - lazy load
- (AVAudioRecorder *)recorder{
    if (_recorder == nil) {
        
        NSString *filePath = JRECORDER_FILE_PATH;
        
        //录音设置
        NSMutableDictionary *recordingSettings = [[NSMutableDictionary alloc] init];
        //设置录音格式
        [recordingSettings setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
        //采样率 采样率必须要设为11025才能使转化成mp3格式后不会失真
        [recordingSettings setValue :[NSNumber numberWithFloat:11025.0] forKey: AVSampleRateKey];//44100.0
        [recordingSettings setValue :[NSNumber numberWithInt:2] forKey: AVNumberOfChannelsKey];
        // 采用浮点采样
        [recordingSettings setValue:@YES forKey:AVLinearPCMIsFloatKey];
        //音频质量,采样质量
        [recordingSettings setValue:[NSNumber numberWithInt:AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
        
        NSError *error;
        _recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:filePath] settings:recordingSettings error:&error];
        //_recorder.delegate = self;
        _recorder.meteringEnabled = YES;// 监控声波
        if (error) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error);
            return nil;
        }
    }
    return _recorder;
}


// audioPlayer懒加载getter方法
- (AVAudioPlayer *)audioPlayer {
    _recorder = NULL; // 每次都创建新的播放器，删除旧的
    
    // 资源路径
    NSURL *url = [NSURL fileURLWithPath:JRECORDER_FILE_PATH];
    
    // 初始化播放器，注意这里的Url参数只能为本地文件路径，不支持HTTP Url
    NSError *error = nil;
    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    //设置播放器属性
    _audioPlayer.numberOfLoops = 0;// 不循环
    _audioPlayer.volume = 1; // 音量
    [_audioPlayer prepareToPlay];// 加载音频文件到缓存【这个函数在调用play函数时会自动调用】
    
    if(error){
        NSLog(@"初始化播放器过程发生错误,错误信息:%@",error.localizedDescription);
        return nil;
    }
    
    return _audioPlayer;
}


@end
