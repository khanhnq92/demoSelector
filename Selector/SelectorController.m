//
//  ViewController.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/15/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "SelectorController.h"

@interface SelectorController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation SelectorController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self performSelector:@selector(doHide) withObject:nil afterDelay:2];
}
- (IBAction)onCrunchData:(id)sender {
//    [self performSelectorOnMainThread:@selector(doCrunchData) withObject:nil waitUntilDone:true];
    
    [self performSelectorOnMainThread:@selector(processData:) withObject:@{@"Apple":@"Tao",@"Dog":@"Cho"} waitUntilDone:false];
}
-(void) processData:(NSDictionary*)data{
    for ( NSString*key in [data allKeys]) {
        NSLog(@"%@ %@\n",key,[data valueForKey:key]);

    }
    
}
-(void) doHide{
    _slider.hidden=YES;
}

-(void) doCrunchData{
    [NSThread sleepForTimeInterval:2];
}

@end
