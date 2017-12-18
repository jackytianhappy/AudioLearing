//
//  AccelerateRateVC.m
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/17.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#import "AccelerateRateVC.h"
#import "PCM_acceleate_rate.h"
#import "PathFile.h"

@interface AccelerateRateVC ()

@end

@implementation AccelerateRateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"左右声道加速";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    [btn setTitle:@"开始加速" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(_startDivide) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];

}

- (void)_startDivide{
    
    [[NSFileManager defaultManager] removeItemAtPath:JRECORDER_FILE_PATH_ACCERATE_PATH error:nil];
    [[NSFileManager defaultManager] createFileAtPath:JRECORDER_FILE_PATH_ACCERATE_PATH contents:nil attributes:nil];
    
    
    NSLog(@"加速");
    int m = simplest_pcm16le_doublespeed([JRECORDER_FILE_PATH cString],[JRECORDER_FILE_PATH_ACCERATE_PATH cString]);
    NSLog(@"加速成功");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
