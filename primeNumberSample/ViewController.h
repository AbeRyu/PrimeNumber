//
//  ViewController.h
//  primeNumberSample
//
//  Created by 阿部 竜之介 on 2014/12/11.
//  Copyright (c) 2014年 RyunosukeAbe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    int point;  //ゲーム中の得点
    int score;  //結果用
    int num;    //現在表示されている数字
    NSMutableArray *primeArray;
    NSMutableArray *numberArray;
}


@end

