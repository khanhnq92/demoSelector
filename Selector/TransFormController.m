//
//  TransFormController.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/23/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "TransFormController.h"

@interface TransFormController ()
@property (weak, nonatomic) IBOutlet UIImageView *vimg;
@property (weak, nonatomic) IBOutlet UIButton *btnAuto;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation TransFormController{
    NSTimer* timer;
    bool check;
    bool checkTimer;
    CATransform3D t;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    check=false;
    checkTimer=true;
    
   
}
-(void)runningTransForm{
    if (check) {
        [UIView animateWithDuration: 2 animations:^{
            t = CATransform3DIdentity;
            t.m34 = +0.005;
            t = CATransform3DRotate(t, M_PI / 6.0, 0.0, 1.0, 0.0);
            self.vimg.layer.transform = t;
        }];
    }else{
        [UIView animateWithDuration: 2 animations:^{
            t = CATransform3DIdentity;
            t.m34 = -0.005;
            t = CATransform3DRotate(t, M_PI / 6.0, 0.0, 1.0, 0.0);
            self.vimg.layer.transform = t;
        }];
    }
    
    check=!check;
}
- (IBAction)doSlider:(id)sender {
    [timer invalidate];
     [_btnAuto setTitle:@"Auto" forState:UIControlStateNormal];
    t = CATransform3DIdentity;
    if (_slider.value<5) {
        t.m34 = -0.005+_slider.value/1000;
    }else{
        if (_slider.value>5) {
            t.m34 = +0.005- (10-_slider.value)/1000;
        }else
            t.m34 = 0;
    }
    t = CATransform3DRotate(t, M_PI / 6.0, 0.0, 1.0, 0.0);
    self.vimg.layer.transform = t;
}
- (IBAction)doAuto:(id)sender {
    if(checkTimer){
        [timer invalidate];
        [_btnAuto setTitle:@"Auto" forState:UIControlStateNormal];
    }else{
        [self runningTransForm];
        timer= [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(runningTransForm) userInfo:nil repeats:true];
        [_btnAuto setTitle:@"Turn Off Auto" forState:UIControlStateNormal];
    }
    checkTimer=!checkTimer;
}
@end
