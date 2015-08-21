//
//  DropBall.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/19/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()
@end

@implementation DropBall{
    CGFloat x,y,vellocity,accellerate,maxHeight;
    UIImageView* vimage;
    NSTimer* timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self addSprite];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.0167
                                           target:self
                                         selector:@selector(animationBall)
                                         userInfo:nil
                                          repeats:true];
}
-(void)animationBall{
    vellocity+=accellerate;
    y+=vellocity;
    if(y>maxHeight){
        vellocity=-vellocity*0.9;
        y=maxHeight;
    }
    vimage.center=CGPointMake(x, y);
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [timer invalidate];
}
-(void)addSprite{
    vimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"soccer"]];
    x=self.view.bounds.size.width/2;
    y=25;
    vimage.center=CGPointMake(x, y);
    [self.view addSubview:vimage];
    
    maxHeight=self.view.bounds.size.height-[UIApplication sharedApplication].statusBarFrame.size.height -self.navigationController.navigationBar.bounds.size.height-25;
    vellocity=0.0;
    accellerate=0.25;
}
@end