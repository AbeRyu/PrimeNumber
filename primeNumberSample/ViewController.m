//
//  ViewController.m
//  primeNumberSample
//
//  Created by 阿部 竜之介 on 2014/12/11.
//  Copyright (c) 2014年 RyunosukeAbe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self makePrimeShooter];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)makePrimeShooter{
    
    //画面取得
    UIScreen *sc = [UIScreen mainScreen];
    
    //ステータスバー込みのサイズ
    CGRect rect = sc.bounds;
    NSLog(@"%.1f, %.1f", rect.size.width, rect.size.height);
    
    //ステータスバーを除いたサイズ
    //    rect = sc.applicationFrame;
    //    NSLog(@"%.1f, %.1f", rect.size.width, rect.size.height);
    
    
    UIView *moveView =[[UIView alloc] initWithFrame:CGRectMake(rect.size.width/2-50,rect.size.height-200,100,100)];
    moveView.backgroundColor =  [UIColor blackColor];
    [self.view addSubview:moveView];
    NSLog(@"%.1f, %.1f", moveView.center.x, moveView.center.y);
    moveView.layer.cornerRadius = 50.0;
    moveView.layer.borderColor = [[UIColor blueColor]CGColor];
    moveView.layer.borderWidth = 5;
    
    
    // UILabelを生成
    UILabel *primeLabel = [[UILabel alloc] init];
    primeLabel.frame = CGRectMake(moveView.frame.size.width/2-37.5, moveView.frame.size.height/2-37.5, 75, 75);
    primeLabel.text = @"1994";
    primeLabel.textAlignment = UITextAlignmentCenter;
    //    primeLabel.backgroundColor = [UIColor redColor];
    primeLabel.textColor = [UIColor whiteColor];
    primeLabel.font = [UIFont boldSystemFontOfSize:30];
    [moveView addSubview:primeLabel];
}
@end
