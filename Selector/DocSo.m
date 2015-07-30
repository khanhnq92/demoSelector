//
//  DocSo.m
//  Selector
//
//  Created by ios31 on 7/30/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "DocSo.h"

@interface DocSo ()
@end

@implementation DocSo{
    NSArray* digit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    digit=@[@"không",@"một",@"hai",@"ba",@"bốn",@"năm",@"sáu",@"bảy",@"tám",@"chín",@"mười"];
    [self print:10];
    // Do any additional setup after loading the view.
}
-(void)print:(int) num{
    if(0<=num &&num<=10)
        NSLog(@"%@",digit[num]);
    else{
        int dau=(int)num/10;
        int thu=(int)num%10;
        if(dau==1)
            NSLog(@"Mười %@",digit[thu]);
        else{
            if(thu==0)
                NSLog(@"%@ mươi",digit[dau]);
            else{
                NSLog(@"%@ mươi %@",digit[dau],digit[thu]);
            }
        }
    }
}


@end
