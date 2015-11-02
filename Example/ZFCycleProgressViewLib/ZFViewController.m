//
//  ZFViewController.m
//  ZFCycleProgressViewLib
//
//  Created by nicfzhou on 10/31/2015.
//  Copyright (c) 2015 nicfzhou. All rights reserved.
//

#import "ZFViewController.h"
#import "ZFCycleProgressView.h"

@interface ZFViewController ()
@property ZFCycleProgressView *progress;
@end

@implementation ZFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _progress = [[ZFCycleProgressView alloc] initWithFrame:CGRectMake(20, 20, 150, 100) style:[ZFCycleProgressStyle defaultStyle]];
    [self.view addSubview:_progress];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(140, 20, 80, 30);
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:@"+1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnHit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(140, 60, 80, 30);
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:@"-1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnHit2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //    [self.view setBackgroundColor:[UIColor greenColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) btnHit{
    _progress.progress += 10;
    _progress.progress += 10;
    
}
-(void) btnHit2{
    _progress.progress -= 10;
    _progress.progress -= 10;
}

@end
