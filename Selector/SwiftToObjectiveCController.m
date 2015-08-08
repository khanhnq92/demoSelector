//
//  SwiftToObjectiveCController.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/8/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "SwiftToObjectiveCController.h"

@interface SwiftToObjectiveCController ()

@end

@implementation SwiftToObjectiveCController{
    UIView* content;
    CGFloat margin,itemSize;
    UISlider* slider;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    margin=10.0;
    self.view.backgroundColor=[UIColor grayColor];
    [self addSprite];
}
-(void) addSprite{
    content=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width-margin*2, self.view.bounds.size.width-margin*2)];
    content.backgroundColor=[UIColor blackColor];
    [self.view  addSubview:content];
    content.center=CGPointMake(self.view.bounds.size.width/2,self.view.bounds.size.height/2);
    itemSize=content.frame.size.width/8;
    
    for (int i=0; i<8; i++) {
        for (int j=0; j<8; j++) {
            CGRect size= CGRectMake(itemSize*i, itemSize*j,itemSize, itemSize);
            UIView* item=[[UIView alloc] initWithFrame:size];
            if(i%2==0){
                item.backgroundColor=(j%2==0)?[UIColor blackColor]:[UIColor whiteColor];
            }else
                item.backgroundColor=(j%2==0)?[UIColor whiteColor]:[UIColor blackColor];
        
            [content addSubview:item];
        }
    }
    //Slider
    slider = [[UISlider alloc]initWithFrame:CGRectMake(0,0,content.frame.size.width-40, 10)];
    slider.minimumValue=0;
    slider.maximumValue=1;
    slider.value=0.5;
    [slider addTarget:self action:@selector(transformValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    slider.center=CGPointMake(self.view.bounds.size.width/2,self.view.bounds.size.height/2+220);
}
-(void)transformValue:(UISlider*)sender{
    content.transform=CGAffineTransformMakeRotation((CGFloat)sender.value*M_PI);
}
@end
