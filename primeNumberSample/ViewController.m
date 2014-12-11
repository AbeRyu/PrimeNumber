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
    
    
    primeArray = [[NSMutableArray alloc] init];
    //数値として追加
    [primeArray addObject:[NSNumber numberWithInteger:2]];
    [primeArray addObject:[NSNumber numberWithInteger:3]];
    [primeArray addObject:[NSNumber numberWithInteger:5]];
    [primeArray addObject:[NSNumber numberWithInteger:7]];
    [primeArray addObject:[NSNumber numberWithInteger:11]];
    [primeArray addObject:[NSNumber numberWithInteger:13]];
    [primeArray addObject:[NSNumber numberWithInteger:17]];
    [primeArray addObject:[NSNumber numberWithInteger:19]];
    [primeArray addObject:[NSNumber numberWithInteger:23]];
    [primeArray addObject:[NSNumber numberWithInteger:29]];
    [primeArray addObject:[NSNumber numberWithInteger:37]];
    [primeArray addObject:[NSNumber numberWithInteger:41]];
    [primeArray addObject:[NSNumber numberWithInteger:43]];
    [primeArray addObject:[NSNumber numberWithInteger:47]];
    [primeArray addObject:[NSNumber numberWithInteger:53]];
    [primeArray addObject:[NSNumber numberWithInteger:59]];
    [primeArray addObject:[NSNumber numberWithInteger:61]];
    [primeArray addObject:[NSNumber numberWithInteger:67]];
    [primeArray addObject:[NSNumber numberWithInteger:71]];
    [primeArray addObject:[NSNumber numberWithInteger:73]];
    [primeArray addObject:[NSNumber numberWithInteger:79]];
    [primeArray addObject:[NSNumber numberWithInteger:83]];
    [primeArray addObject:[NSNumber numberWithInteger:89]];
    [primeArray addObject:[NSNumber numberWithInteger:97]];
    //以下に任意の数だけ追加していきます
    
    numberArray = [[NSMutableArray alloc] init];
    //数値として追加
    [numberArray addObject:[NSNumber numberWithInteger:10]];
    [numberArray addObject:[NSNumber numberWithInteger:20]];
    [numberArray addObject:[NSNumber numberWithInteger:30]];
    [numberArray addObject:[NSNumber numberWithInteger:40]];
    [numberArray addObject:[NSNumber numberWithInteger:50]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:70]];
    [numberArray addObject:[NSNumber numberWithInteger:80]];
    [numberArray addObject:[NSNumber numberWithInteger:90]];
    [numberArray addObject:[NSNumber numberWithInteger:100]];
    //以下に任意の数だけ追加していきます
    
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
    
    //弾く為のViewを生成
    moveView =[[UIView alloc] initWithFrame:CGRectMake(rect.size.width/2-50,rect.size.height-200,100,100)];
    moveView.backgroundColor =  [UIColor blackColor];
    moveView.layer.cornerRadius = 50.0;
    NSArray* colors = @[UIColor.redColor, UIColor.blueColor, UIColor.greenColor, UIColor.yellowColor];
    moveView.layer.borderColor = [colors[arc4random()%colors.count] CGColor];
    moveView.layer.borderWidth = 5;
    //画面にmoveViewを追加
    [self.view addSubview:moveView];
//    NSLog(@"%.1f, %.1f", moveView.center.x, moveView.center.y);

    
    // UILabelを生成
    UILabel *primeLabel = [[UILabel alloc] init];
    primeLabel.frame = CGRectMake(moveView.frame.size.width/2-37.5, moveView.frame.size.height/2-37.5, 75, 75);
    
    //素数かそれ以外かランダムで生成
    if(arc4random_uniform(2) == 0){
        int select1 = arc4random() % numberArray.count;
        num = [[numberArray objectAtIndex:select1] intValue];
    }else{
        int select2 = arc4random() % primeArray.count;
        num = [[primeArray objectAtIndex:select2] intValue];
    }
    //ラベルに代入
    primeLabel.text = [NSString stringWithFormat:@"%d",num];
    primeLabel.textAlignment = UITextAlignmentCenter;
    //    primeLabel.backgroundColor = [UIColor redColor];
    primeLabel.textColor = [UIColor whiteColor];
    primeLabel.font = [UIFont boldSystemFontOfSize:30];
    //ラベルをmoveViewに追加
    [moveView addSubview:primeLabel];
}

- (void)panAction:(UIPanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan){//タップ初め
        
    }
    
    if (sender.state == UIGestureRecognizerStateEnded){//タップ終わり

    }
    
    
}


/* -- デバッグ用ボタン --*/
-(IBAction)debug{

    
    
    for(int i = 0; i <100 ; i++){
        moveView.center = CGPointMake(moveView.center.x + 1, moveView.center.y - 1);
        [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    }
    
        [moveView removeFromSuperview];
    
        [self makePrimeShooter];
}
@end
