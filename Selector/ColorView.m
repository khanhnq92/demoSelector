//
//  ColorView.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/17/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "ColorView.h"
#import "UIColor+color.m"
@implementation ColorView{
    UILabel *label;
}
-(instancetype)initWithHex:(NSString*)hex
                     alpha:(float)alpha
                     frame:(CGRect)frame{
    self=[super initWithFrame:frame];
    self.backgroundColor=[[UIColor alloc] initWithHex:hex alpha:alpha];
    if(frame.size.width>150&&frame.size.height>30){
        label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width-10, 30)];
        label.center=CGPointMake(frame.size.width/2, frame.size.height/2);
        label.text=hex;
        [self addSubview:label];
    }
    return self;
}

-(void)setHex:(NSString*)hex{
    self.backgroundColor=[[UIColor alloc]initWithHex:hex alpha:1.0];
    label.text=hex;
    label.textColor=[UIColor blackColor];
}
-(void)fadeOut{
    self.backgroundColor=[[UIColor alloc]initWithHex:self.hex alpha:0.1];
    label.textColor=[[UIColor alloc ]initWithHex:@"000000" alpha:0.1];
}
@end
