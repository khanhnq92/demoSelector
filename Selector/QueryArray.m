//
//  QueryArray.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/29/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "QueryArray.h"
#import "Student.h"
@interface QueryArray ()

@end

@implementation QueryArray

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* img= [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://techmaster.vn/theme_resources/frontend/tech/img/logo.png"]]];
    NSArray* arr=@[@"abc",@3.12,img];
    NSLog(@"Tim thay tai index:%ld",[arr indexOfObject:img]);
   
    Student* a=[[Student alloc] init:@"Jack Ma" andID:@"1"];
    Student* b=[[Student alloc] init:@"Bin Gate" andID:@"2"];
    Student* c=[[Student alloc] init:@"Khanh Nguyen" andID:@"1"];
    
}


@end
