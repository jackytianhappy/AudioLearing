//
//  DivideSoundChanel.m
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/14.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#import "DivideSoundChanelVC.h"
#import "PCM16LE_Left_Right_Divide.h"
#import "PathFile.h"

@interface DivideSoundChanelVC ()

@end

@implementation DivideSoundChanelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initUI];
}

- (void)_initUI{
    self.title = @"分离左右声道";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    [btn setTitle:@"开始分离" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(_startDivide) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
    
    UIButton *btnOne = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+ 10, CGRectGetMinY(btn.frame), 100, 100)];
    [btnOne setTitle:@"播放左声道" forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(_playLeftVoice) forControlEvents:UIControlEventTouchUpInside];
    [btnOne setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:btnOne];
    
    
    UIButton *btnTwo = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnOne.frame)+ 10, CGRectGetMinY(btn.frame), 100, 100)];
    [btnTwo setTitle:@"播放右声道" forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(_playRightVoice) forControlEvents:UIControlEventTouchUpInside];
    [btnTwo setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:btnTwo];
    
}

- (void)_startDivide{
    NSLog(@"开始分离");
    
    int m = simplest_pcm16le_split([JRECORDER_FILE_PATH cString], [JRECORDER_FILE_PATH_LEFT_PART cString], [JRECORDER_FILE_PATH_RIGHT_PART cString]);
    
}

- (void)_playLeftVoice{
    NSLog(@"开始播放左声道");
}

- (void)_playRightVoice{
    NSLog(@"开始播放右声道");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
