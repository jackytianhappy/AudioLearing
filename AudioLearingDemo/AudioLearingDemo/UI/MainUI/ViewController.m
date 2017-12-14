//
//  ViewController.m
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/14.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#import "ViewController.h"
#import "JRecorder.h"

static const float kTableViewToppadding  = 200;


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *dataSource;
}

@property (nonatomic, strong) UIButton *starRecordingBtn;
@property (nonatomic, strong) UIButton *stopRecordingBtn;
@property (nonatomic, strong) UIButton *playBtn;


@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self _initData];
    [self _initUI];
    
    
    
}




#pragma mark - private
- (void)_record{ //开始录音
    self.starRecordingBtn.hidden = YES;
    self.stopRecordingBtn.hidden = NO;
    
    [[JRecorder sharedInstace] startRecord];
    
}

- (void)_stopRecord{ //停止录音
    self.starRecordingBtn.hidden = NO;
    self.stopRecordingBtn.hidden = YES;
    
    [[JRecorder sharedInstace] stopRecord];
}

- (void)_play{
    self.starRecordingBtn.hidden = NO;
    self.stopRecordingBtn.hidden = YES;
    
    [[JRecorder sharedInstace] playSound];
}

- (void)_initData{
    dataSource = @[
                   @"分离左右声道"
                   ];
}

- (void)_initUI{
    [self.starRecordingBtn addTarget:self action:@selector(_record) forControlEvents:UIControlEventTouchUpInside];
    [self.stopRecordingBtn addTarget:self action:@selector(_stopRecord) forControlEvents:UIControlEventTouchUpInside];
    self.stopRecordingBtn.hidden = YES;
    [self.playBtn addTarget:self action:@selector(_play) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - tableview delegate and dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCellIdentifier"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = dataSource[indexPath.row];
    
    return cell;
}


#pragma mark - lazy load
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTableViewToppadding, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UIButton *)starRecordingBtn{
    if (_starRecordingBtn == nil) {
        _starRecordingBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, (kTableViewToppadding - 40)/2, 80, 80)];
        [_starRecordingBtn setTitle:@"录音" forState:UIControlStateNormal];
        [_starRecordingBtn setBackgroundColor:[UIColor greenColor]];
        [self.view addSubview:_starRecordingBtn];
    }
    return _starRecordingBtn;
}

- (UIButton *)stopRecordingBtn{
    if (_stopRecordingBtn == nil) {
        _stopRecordingBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.starRecordingBtn.frame)+ 20, CGRectGetMinY(self.starRecordingBtn.frame), self.starRecordingBtn.frame.size.width, self.starRecordingBtn.frame.size.height)];
        [_stopRecordingBtn setTitle:@"停止" forState:UIControlStateNormal];
        [_stopRecordingBtn setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:_stopRecordingBtn];
    }
    return _stopRecordingBtn;
}

- (UIButton *)playBtn{
    if (_playBtn == nil) {
        _playBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.stopRecordingBtn.frame)+ 20, CGRectGetMinY(self.stopRecordingBtn.frame), self.stopRecordingBtn.frame.size.width, self.stopRecordingBtn.frame.size.height)];
        [_playBtn setTitle:@"播放" forState:UIControlStateNormal];
        [_playBtn setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:_playBtn];
    }
    return _playBtn;
}


@end
