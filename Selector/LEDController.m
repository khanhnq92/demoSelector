//
//  LEDController.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/20/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "LEDController.h"

@interface LEDController ()

@end

@implementation LEDController{
    CGFloat magin;
    int _numberOfBall;
    CGFloat space;
    CGFloat balldiameter;
    NSTimer* timer;
    int indexBall;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    magin=40.0;
    balldiameter=24.0;
    _numberOfBall=8;
    //    [self placeBallatX:100 andY:100 withTag:1];
    [self numberOfBall];
    [self drawRowofBall:_numberOfBall];
    indexBall=_numberOfBall+1;
    timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(runningBall) userInfo:nil repeats:true];
}
-(void)runningBall{
    if(indexBall!=_numberOfBall+1){
        [self turnOff:indexBall];
    }
    indexBall--;
    if(indexBall==-1)
        indexBall=_numberOfBall-1;
    [self turnOn:indexBall];
}
-(void)turnOn:(int)tagBall{
    UIView* vBall=[self.view viewWithTag:tagBall+1];
    if(vBall&&[vBall isMemberOfClass:[UIImageView class]]){
        UIImageView* img=(UIImageView*)vBall;
        img.image=[UIImage imageNamed:@"ball_running"];
    }
}
-(void)turnOff:(int)tagBall{
    UIView* vBall=[self.view viewWithTag:tagBall+1];
    if(vBall&&[vBall isMemberOfClass:[UIImageView class]]){
        UIImageView* img=(UIImageView*)vBall;
        img.image=[UIImage imageNamed:@"ball"];
    }
}

-(void) placeBallatX:(CGFloat)x
                andY:(CGFloat)y
             withTag:(int)tag{
    UIImageView*ball=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball"]];
    ball.center=CGPointMake(x,y);
    ball.tag=tag;
    [self.view addSubview:ball];
}
-(CGFloat) spaceBetweenBall:(int)n{
    return (self.view.bounds.size.width -2*magin)/(n-1);
}
-(void)numberOfBall{
    bool stop=false;
    int n=3;
    while(!stop){
        space=[self spaceBetweenBall:n];
        if(space<balldiameter)
            stop=true;
        else
            NSLog(@"Number of ball %d, space between ball center %3.0f",n,space);
        n++;
    }
}
-(void) drawRowofBall:(int)numberBall{
    space=[self spaceBetweenBall:numberBall];
    for (int i=0; i<numberBall; i++) {
        [self placeBallatX:magin+i*space
                      andY:150
                   withTag:i+1];
    }
}
@end
