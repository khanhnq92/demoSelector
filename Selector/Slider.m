//
//  Slider.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/20/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "Slider.h"

@interface Slider ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation Slider{
    NSTimer* timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    timer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    _slider.transform=CGAffineTransformMakeRotation(M_PI_4);
    _slider.thumbTintColor=[UIColor redColor];
    _slider.maximumTrackTintColor=[UIColor redColor];
    
}
-(void)onTimer{
    _slider.value+=0.05;
    if(_slider.value>=1)
    {
        _slider.value=1.0;
        [timer invalidate];
        
    }
}

@end
