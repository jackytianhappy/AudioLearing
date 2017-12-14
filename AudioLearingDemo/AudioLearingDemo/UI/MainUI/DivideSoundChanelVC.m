//
//  DivideSoundChanel.m
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/14.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#import "DivideSoundChanelVC.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
