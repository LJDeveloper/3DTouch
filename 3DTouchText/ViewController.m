//
//  ViewController.m
//  3DTouchText
//
//  Created by mac on 16/11/14.
//  Copyright © 2016年 沸腾医疗. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>

@interface ViewController ()
{
    MBProgressHUD *HUD;
}
@property(nonatomic,copy)NSString *str;
@property(nonatomic,strong)UILabel *lable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.str = @"静东的第一个关于3DTouch功能的Demo";
    self.lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    self.lable.backgroundColor = [UIColor blackColor];
    self.lable.textColor = [UIColor whiteColor];
    self.lable.textAlignment = NSTextAlignmentCenter;
    self.lable.adjustsFontSizeToFitWidth = YES;
    self.lable.text = self.str;
    self.lable.center = self.view.center;
    [self.view addSubview:self.lable];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    //HUD.dimBackground = YES;
    HUD.labelText = @"3DTouch";
    HUD.color = [UIColor grayColor];
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        sleep(3);
    }completionBlock:^{
        //操作执行完后取消对话框
        [HUD removeFromSuperview];
        HUD = nil;
        self.lable.alpha = 1.5;
    }];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi) name:@"tongzhi" object:nil];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhii) name:@"tongzhii" object:nil];
}
- (void)tongzhi
{
    self.lable.alpha = 0;
    self.lable.text = @"你是通过3DTouch进来的!";
    //初始化进度框，置于当前的View当中
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.dimBackground = YES;
    HUD.labelText = @"3DTouch";
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        sleep(3);
    }completionBlock:^{
        //操作执行完后取消对话框
        [HUD removeFromSuperview];
        HUD = nil;
        self.lable.alpha = 1.5;
    }];
 }
- (void)tongzhii
{
    self.lable.text = @"静东的第一个关于3DTouch功能的Demo";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
