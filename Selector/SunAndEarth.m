//
//  SunAndEarth.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/18/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "SunAndEarth.h"
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"
@interface SunAndEarth ()

@end

@implementation SunAndEarth{
    UIImageView *moon,*earth;
    FLAnimatedImageView* sun;
    NSTimer*	timer,*timer2;
    CGFloat angleEarth,angleMoon,distanceEarthtoSun,distanceMoontoEarth;
    CGPoint sunCenter,nhap1,nhap2;
    int dem1,dem2;
    UILabel* lblyear,*lblDay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    [self addSprite];
    distanceEarthtoSun=earth.center.x-sun.center.x;
    distanceMoontoEarth=moon.center.x-earth.center.x;
    dem1=0;
    dem2=0;
    timer=[NSTimer scheduledTimerWithTimeInterval:0.0167
                                           target:self
                                         selector:@selector(runningEarth)
                                         userInfo:nil
                                          repeats:true];
}
-(void)runningEarth{
    angleEarth+=0.1;
    earth.center=[self setPositionofEarth:angleEarth];
    angleMoon=angleEarth*360;
    moon.center=[self setPositionofMoon:angleMoon];
    int demNgay=(int)ceilf(angleMoon);
    int demNam=(int)ceilf(angleEarth);
    if(demNgay%360==0){
        lblDay.text=[NSString stringWithFormat:@"Ngày: %d",++dem1];
        NSLog(@"%d",dem1);
    }
    if(demNam%360==0)
        lblyear.text=[NSString stringWithFormat:@"Năm: %d",++dem2];
}
-(void)addSprite{
    FLAnimatedImage *imgSun = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[self getPathForFileName:@"sun" andType:@"gif"]]]];
    sun = [[FLAnimatedImageView alloc] init];
    sun.animatedImage = imgSun;
    sun.frame=CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2  , 100, 101);
    sunCenter=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    sun.center=sunCenter;
    sun.animationDuration=2;
    [self.view addSubview:sun];
    
    angleEarth=0.0;
    moon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon.png"]];
    moon.frame=CGRectMake(0,0, 20, 20);
    moon.center=CGPointMake(self.view.bounds.size.width-20, self.view.bounds.size.height/2);
    [self.view addSubview:moon];
    
    angleMoon=0.0;
    earth=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    earth.frame=CGRectMake(0,0, 40, 40);
    earth.center=CGPointMake(self.view.bounds.size.width-55, self.view.bounds.size.height/2);
    [self.view addSubview:earth];
    
    lblDay=[[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    lblyear=[[UILabel alloc] initWithFrame:CGRectMake(120, 100, 100, 30)];
    lblyear.text=@"Năm:";
    lblDay.text=@"Ngày:";
    lblDay.textColor=[UIColor whiteColor];
    lblyear.textColor=[UIColor whiteColor];
    [self.view addSubview:lblyear];
    [self.view addSubview:lblDay];
}
-(void)viewDidDisappear:(BOOL)animated{
    [timer invalidate];
}
-(CGPoint)setPositionofEarth:(CGFloat)angle{
    return CGPointMake(sunCenter.x+ distanceEarthtoSun*cos(angle*M_PI/180),
                       sunCenter.y+ distanceEarthtoSun*sin(angle*M_PI/180));
}
-(CGPoint)setPositionofMoon:(CGFloat)angle{
    return CGPointMake(earth.center.x+ distanceMoontoEarth*cos(angle*M_PI/180),
                       earth.center.y+ distanceMoontoEarth*sin(angle*M_PI/180));
}
-(NSString*)getPathForFileName:(NSString*) fileName andType:(NSString*) type{
    return  [[NSBundle mainBundle] pathForResource:fileName ofType:type];
}
@end
