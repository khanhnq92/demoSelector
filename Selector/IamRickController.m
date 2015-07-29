//
//  ViewController.m
//  IamRick
//
//  Created by Huy Quang Ngo on 7/8/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "IamRickController.h"

@interface IamRickController ()
@property (weak, nonatomic) IBOutlet UILabel *lbliamRick;
@property (weak, nonatomic) IBOutlet UIImageView *ruby;

@end

@implementation IamRickController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ruby.alpha=0;
    _lbliamRick.alpha=0;
    
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIView animateWithDuration:2 animations:^{_ruby.alpha=1;} completion:^(BOOL finished){
        [UIView animateWithDuration:2 animations:^{
            _lbliamRick.center=CGPointMake(_lbliamRick.center.x, 350);
            _lbliamRick.alpha=1;
        } completion:nil];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
