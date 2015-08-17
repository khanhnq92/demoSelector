//
//  StartsField.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/17/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "StartsField.h"
#import <AVFoundation/AVFoundation.h>

@interface StartsField ()

@end

@implementation StartsField{
    CGFloat deltaX,deltaY;
    UIImageView* red,*green,*brown,*violet;
    CGPoint center;
    AVAudioPlayer* player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self playSong];
    deltaX=50;
    deltaY=50;
    self.view.backgroundColor=[UIColor whiteColor];
//    self.edgesForExtendedLayout=UIRectEdgeNone;
    center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    red=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    green=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    brown=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown"]];
    violet=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet"]];
    [self setlocation];
    [self.view addSubview:green];
    [self.view addSubview:brown];
    [self.view addSubview:violet];
    [self.view addSubview:red];
    [self animation];
}
-(void)playSong{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"mobileBackGround" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                    error:&error];
    [player prepareToPlay];
    [player play];
}
-(void)animation{
    [UIView animateWithDuration:1.5 animations:^{
        red.center=CGPointMake(red.center.x+deltaX,red.center.y-deltaY);
        green.center=CGPointMake(green.center.x-deltaX,green.center.y-deltaY);
        brown.center=CGPointMake(brown.center.x-deltaX,brown.center.y+deltaY);
        violet.center=CGPointMake(violet.center.x+deltaX,violet.center.y+deltaY);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.3 animations:^{
            red.center=CGPointMake(red.center.x-deltaX,red.center.y-deltaY);
            green.center=CGPointMake(green.center.x-deltaX,green.center.y+deltaY);
            brown.center=CGPointMake(brown.center.x+deltaX,brown.center.y+deltaY);
            violet.center=CGPointMake(violet.center.x+deltaX,violet.center.y-deltaY);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                [self setlocation];
            } completion:^(BOOL finished) {
                [self animation];
            }];
        }];
    }];
}
-(void)setlocation{
    red.center=center;
    green.center=center;
    brown.center=center;
    violet.center=center;
}

@end