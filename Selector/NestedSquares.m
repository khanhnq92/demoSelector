//
//  NestedSquares.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/10/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "NestedSquares.h"
#import "AVFoundation/AVFoundation.h"
@interface NestedSquares ()

@end

@implementation NestedSquares{
    AVAudioPlayer* player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self drawNestedSquares];
//    [self playSong];
    [self performSelector:@selector(rotateAllSquare) withObject:self afterDelay:2];
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
- (void) viewWillDisappear:(BOOL)animated {
    [player stop];
}
-(void)rotateAllSquare{
    [UIView animateWithDuration:2 animations:^{
        for (int i=0; i<self.view.subviews.count; i++) {
            if(i%2==0){
                ((UIView*)self.view.subviews[i]).transform=CGAffineTransformMakeRotation(M_PI_4);
            }else
                ((UIView*)self.view.subviews[i]).transform=CGAffineTransformIdentity;
        }
    }];
}
-(void)drawNestedSquares{
    CGSize mainViewSize=self.view.bounds.size;
    CGFloat margin=20;
    CGFloat rectSize=mainViewSize.width-margin*2.0 ;
    CGFloat statusNavigaionBarHeight=[UIApplication sharedApplication].statusBarFrame.size.height +self.navigationController.navigationBar.bounds.size.height;
    CGPoint center=CGPointMake(mainViewSize.width/2, (statusNavigaionBarHeight+mainViewSize.height)/2);
    for (int i=0; i<10; i++) {
        UIView* view;
        if(i%2==0){
            view=[self drawSquareByWidth:rectSize
                               andRotate:false
                               andCenter:center];
        }else{
            view=[self drawSquareByWidth:rectSize
                               andRotate:true
                               andCenter:center];
        }
        rectSize*=0.707;
        [self.view addSubview:view];
    }
}
-(UIView*) drawSquareByWidth:(CGFloat)width
                andRotate:(BOOL)rotate
                andCenter:(CGPoint)center{
    UIView* square=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
    square.center=center;
    square.backgroundColor=rotate?[UIColor whiteColor]:[UIColor darkGrayColor];
    square.transform=rotate?CGAffineTransformMakeRotation(M_PI_4):CGAffineTransformIdentity;
    return square;
    
}
@end
