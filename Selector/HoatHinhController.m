//
//  HoatHinhController.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/10/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "HoatHinhController.h"

@interface HoatHinhController ()

@end

@implementation HoatHinhController{
    UIImageView* vImg;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor blackColor]];
//    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self burnFire];
}
-(void)burnFire{
    vImg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    NSMutableArray* arr=[NSMutableArray new];
    for (int i=1; i<=13; i++) {
        NSString* fileName=[NSString stringWithFormat:@"burningFire%d",i];
        UIImage* img=[UIImage imageNamed:fileName];
        [arr addObject:img];
    }
//    vImg.animationImages=arr;
    vImg.animationImages=@[[UIImage imageNamed:@"burningFire1.png"],
                           [UIImage imageNamed:@"burningFire2.png"],
                           [UIImage imageNamed:@"burningFire3.png"],
                           [UIImage imageNamed:@"burningFire4.png"],
                           [UIImage imageNamed:@"burningFire5.png"],
                           [UIImage imageNamed:@"burningFire6.png"],
                           [UIImage imageNamed:@"burningFire7.png"],
                           [UIImage imageNamed:@"burningFire8.png"],
                           [UIImage imageNamed:@"burningFire9.png"],
                           [UIImage imageNamed:@"burningFire10.png"],
                           [UIImage imageNamed:@"burningFire11.png"],
                           [UIImage imageNamed:@"burningFire12.png"],
                           [UIImage imageNamed:@"burningFire13.png"],
                           ];
    vImg.animationDuration=1;
    vImg.animationRepeatCount=0;
    [self.view addSubview:vImg];
    [vImg startAnimating];
}

@end
