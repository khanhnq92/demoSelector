//
//  SilderAdvanced.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/22/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "SilderAdvanced.h"

@interface SilderAdvanced ()
@property (weak, nonatomic) IBOutlet UIView *vValue;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *lblValue;

@end

@implementation SilderAdvanced{
    NSTimer* timer;
}
- (IBAction)valueChange:(id)sender {
    if(_slider.value>=10){
        _lblValue.text=[NSString stringWithFormat:@"10/10"];
    }else{
        _lblValue.text=[NSString stringWithFormat:@"%2.1f/10",_slider.value];
    }
    CGFloat toaDo=(_slider.value/10)*(_slider.frame.size.width-20);
    [_vValue setCenter:CGPointMake(_slider.frame.origin.x+10+toaDo, _slider.frame.origin.y
                                   +40)];
}
-(void)viewDidDisappear:(BOOL)animated{
    [timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_vValue setCenter:CGPointMake(_slider.frame.origin.x+10, _slider.frame.origin.y
                                   +40)];
    [_slider setThumbImage:[UIImage imageNamed:@"Thumb"] forState:UIControlStateNormal];
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"bg_MinimumTrackImage"] forState:UIControlStateNormal   ];
    [_slider setMaximumTrackImage:[UIImage imageNamed:@"bg_MaximumTrackImage"] forState:UIControlStateNormal];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(runningSlider) userInfo:nil repeats:true];
}
-(void)runningSlider{
    _slider.value+=0.5;
    [self valueChange:self];
    if(_slider.value>=10){
        _slider.value=10;
        [timer invalidate];
    }
}
@end
