//
//  RollingBall.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/17/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall{
    UIImageView* vBall;
    UIImage * imgBall;
    CGFloat ballRadius,angle,toaDoX,toaDoY,x,y,deltaAngle;
    NSTimer* timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    angle=0.0;
    x=y=2;
    deltaAngle=0.05;
    [self addSprite];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runningBall) userInfo:nil repeats:true];
}
-(void)runningBall{
//     vBall.center=CGPointMake(ballRadius*angle,self.view.bounds.size.height/2);
   
    if (toaDoY>=self.view.bounds.size.height - ballRadius) {
        y=-y;
        deltaAngle=-deltaAngle;
    }
    if(toaDoX>=self.view.bounds.size.width-ballRadius||toaDoX<=ballRadius){
        x=-x;
        deltaAngle=-deltaAngle;
    }
    if (toaDoY<=ballRadius) {
        y=-y;
        deltaAngle=-deltaAngle;
    }
    angle+=deltaAngle;
    toaDoX = vBall.center.x+x;
    toaDoY = vBall.center.y+y;
    vBall.center=CGPointMake(toaDoX,toaDoY);
    vBall.transform=CGAffineTransformMakeRotation(angle);
}
-(void)addSprite{
    imgBall=[UIImage imageNamed:@"soccer"];
    ballRadius=imgBall.size.height/2;
    vBall=[[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/2, imgBall.size.width, imgBall.size.height)];
    vBall.image=imgBall;
    [self.view addSubview:vBall];
}
@end
