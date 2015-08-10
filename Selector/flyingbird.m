//
//  flyingbird.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/10/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "flyingbird.h"
#import <AVFoundation/AVFoundation.h>S
@interface flyingbird ()

@end

@implementation flyingbird{
    UIImageView* vImg;
    AVAudioPlayer* player;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addsprite];
    [self downandUp];
//    [self playSong];
}
-(void) playSong{
    NSString* fileName=[[NSBundle mainBundle ] pathForResource:@"birds_cardinal" ofType:@"mp3"];
    NSError* error;
    player=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:fileName] error:&error];
    [player prepareToPlay];
    [player play];
}
-(void)viewDidDisappear:(BOOL)animated{
    [player stop];
}
-(void)downandUp{
    vImg.transform=CGAffineTransformIdentity;
    [UIView animateWithDuration:6 animations:^{
        vImg.center=CGPointMake(self.view.bounds.size.width-55, self.view.bounds.size.height-38);
    } completion:^(BOOL finished) {
        vImg.transform=CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:6 animations:^{
            vImg.center=CGPointMake(15, 68);
        } completion:^(BOOL finished) {
            [self downandUp];
        }];
    }];
}
-(void)addsprite{
    vImg=[[UIImageView alloc] initWithFrame:CGRectMake(15, 68, 110, 68)];
    NSMutableArray* arr=[NSMutableArray new];
    for (int i=0; i<=5; i++) {
        NSString* fileName=[NSString stringWithFormat:@"bird%d",i];
        UIImage* img=[UIImage imageNamed:fileName];
        [arr addObject:img];
    }
    vImg.animationImages=arr;
    vImg.animationDuration=2;
    vImg.animationRepeatCount=0;
    [self.view addSubview:vImg];
    [vImg startAnimating];
}

@end
