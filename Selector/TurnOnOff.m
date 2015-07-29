//
//  TurnOnOff.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/22/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "TurnOnOff.h"

@interface TurnOnOff ()
@property (weak, nonatomic) IBOutlet UIImageView *btnRight;
@property (weak, nonatomic) IBOutlet UIImageView *btnLeft;

@end

@implementation TurnOnOff{
    bool check;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    check=true;
     [_btnRight setUserInteractionEnabled:YES];
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapRight)];
    [_btnRight addGestureRecognizer:tap];
    
    [_btnLeft setUserInteractionEnabled:YES];
    tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapLeft)];
    [_btnLeft addGestureRecognizer:tap];
}
-(void)TapRight{
    if(check){
    _btnRight.image=[UIImage imageNamed:@"OnWhiteRight"];
    _btnLeft.image=[UIImage imageNamed:@"OffWhiteLeft"];
        check=!check;
    }
}
-(void)TapLeft{
    if(!check){
        _btnRight.image=[UIImage imageNamed:@"OffWhiteRight"];
        _btnLeft.image=[UIImage imageNamed:@"OnWhiteLeft"];
                check=!check;
    }
}
@end
