//
//  Hex#2.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/17/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "HexColor.h"
#import "UIColor+color.h"
#import "ColorView.h"
@interface Hex_2 ()

@end

@implementation Hex_2{
    NSArray* cpArray;
    ColorView* view1,*view2,*view3,*view4,*view5;
    int colorIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    NSArray* cp1=@[@"ECD078", @"D95B43", @"C02942", @"542437", @"53777A"];
    NSArray* cp2 = @[@"00A0B0", @"6A4A3C", @"CC333F", @"EB6841", @"EDC951"];
    NSArray* cp3 = @[@"594F4F", @"547980", @"45ADA8", @"9DE0AD", @"E5FCC2"];
    NSArray* cp4 = @[@"FF9900", @"424242", @"E9E9E9", @"BCBCBC", @"3299BB"];
    NSArray* cp5 = @[@"5E412F", @"FCEBB6", @"78C0A8", @"F07818", @"F0A830"];
    NSArray* cp6 = @[@"FAD089", @"FF9C5B", @"F5634A", @"ED303C", @"3B8183"];
    cpArray = @[cp1, cp2, cp3, cp4, cp5, cp6];
    
    CGFloat colorViewWidth=200.0;
    CGFloat colorViewHeight=40;
    CGFloat x0 = (self.view.bounds.size.width - colorViewWidth) * 0.5;
    view1 = [[ColorView alloc] initWithHex: @"556270"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 10, colorViewWidth, colorViewHeight)];
    view2 = [[ColorView alloc] initWithHex: @"4ECDC4"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 60, colorViewWidth, colorViewHeight)];
    view3 = [[ColorView alloc] initWithHex: @"C7F464"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 110, colorViewWidth, colorViewHeight)];
    view4 = [[ColorView alloc] initWithHex: @"FF6B6B"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 160, colorViewWidth, colorViewHeight)];
    view5 = [[ColorView alloc] initWithHex: @"C44D58"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 210, colorViewWidth, colorViewHeight)];

    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    colorIndex=0;
    [self performSelector:@selector(animation:) withObject:[[NSNumber alloc]initWithInt:colorIndex] afterDelay:1];
}
-(void)animation:(NSNumber*)cpIndex{
    [UIView animateWithDuration:2
                     animations:^{
                         int index=[cpIndex intValue];
                         NSArray*cp=cpArray[index];
                         view1.hex=cp[0];
                         view2.hex=cp[1];
                         view3.hex=cp[2];
                         view4.hex=cp[3];
                         view5.hex=cp[4];
                     } completion:^(BOOL finished) {
//                         self->colorIndex++;
//                         if(self->colorIndex==self->cpArray.count){
//                             self->colorIndex=0;
//                         }
//                         [self animation:[[NSNumber alloc] initWithInt:colorIndex ]];
                     [UIView animateWithDuration:2 animations:^{
                         [view1 fadeOut];
                         [view2 fadeOut];
                         [view3 fadeOut];
                         [view4 fadeOut];
                         [view5 fadeOut];
                     } completion:^(BOOL finished) {
                         self->colorIndex++;
                         if(self->colorIndex==self->cpArray.count){
                             self->colorIndex=0;
                         }
                         [self animation:[[NSNumber alloc] initWithInt:colorIndex ]];
                     }];
                     }];
}
@end
