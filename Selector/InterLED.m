//
//  InterLED.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/20/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "InterLED.h"

@interface InterLED ()

@end

@implementation InterLED{
    CGFloat magin;
    int _numberOfBall;
    CGFloat space;
    CGFloat balldiameter;
    NSTimer* timer;
    int indexBall;
    int height;
    int width;
    int XTang;
    int YTang;
    int XGiam;
    int YGiam;
    bool KTTang;
    bool KTXoa;
    int x,y;
}
-(void)viewDidDisappear:(BOOL)animated{
    [timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    magin=40.0;
    height=8;
    width=10;
    balldiameter=24.0;
    _numberOfBall=8;
    x=0;
    y=0;
    XTang=1;
    YTang=0;
    XGiam=height-1;
    YGiam=width;
    KTXoa=false;
    KTTang=true;
    //    [self placeBallatX:100 andY:100 withTag:1];
    [self numberOfBall];
    [self drawRowofBallX:width Y:height];
    
    indexBall=-1;
    timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningBall) userInfo:nil repeats:true];
}
-(void)runningBall{
    
    if (XTang-2==XGiam) {
        x=0;
        y=0;
        XTang=1;
        YTang=0;
        XGiam=height-1;
        YGiam=width;
        KTXoa=!KTXoa;
    }
    if(KTTang){
        if(y<YGiam){
            indexBall=x*width+y;
            y++;
        }else{
            if(x<XGiam){
                x++;
                indexBall=x*width+(y-1);
            }else{
                XGiam--;
                YGiam--;
                y=y-1;
                KTTang=false;
            }
        }
    }
    if (!KTTang) {
        if(y>YTang){
            y--;
            indexBall=x*width+y;
        }else{
            if (x>XTang) {
                x--;
                indexBall=x*width+y;
            }else{
                XTang++;
                YTang++;
                y=y+1;
                indexBall=x*width+y;
                KTTang=true;
            }
        }
        
    }
    NSLog(@"%d, XTang=%d, Xgiam=%d",indexBall,XTang,XGiam);
    NSLog(@"%d, yTang=%d, ygiam=%d",indexBall,YTang,YGiam);
    if (KTXoa) {
       [self turnOff:indexBall];
    }else
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
    ball.center=CGPointMake(x,y+50);
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
-(void) drawRowofBallX:(int)x Y:(int)y{
    space=[self spaceBetweenBall:width];
    for (int i=0; i<y; i++) {
        for (int j=0; j<x; j++) {
            [self placeBallatX:magin+j*space
                          andY:50*(i+1)
                       withTag:i*width+j+1];
            
        }
    }
}
@end
