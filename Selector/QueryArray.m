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
    
// ------Phan 1
    
    UIImage* img= [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://techmaster.vn/theme_resources/frontend/tech/img/logo.png"]]];
    NSArray* arr=@[@"abc",@3.12,img];
    if ([arr containsObject:@"abc"]) {
        NSLog(@"ContainsObject:Tim thay roi!");
    }
   
    Student* a=[[Student alloc] init:@"Jack Ma" andID:@"1"];
    Student* b=[[Student alloc] init:@"Bin Gate" andID:@"2"];
    Student* c=[[Student alloc] init:@"Khanh Nguyen" andID:@"3"];
    NSArray* arrStudent=@[a,b,c];
    Student* d=[[Student alloc] init:@"Khanh Nguyen" andID:@"1"];
    NSLog(@"indexOfObject:Tim thay tai index: %ld",[arrStudent indexOfObject:d]);
    if([arrStudent indexOfObjectIdenticalTo:d]==NSNotFound){
        NSLog(@"indexOfObjectIdenticalTo:Khong tim thay!");
    }else
        NSLog(@"indexOfObjectIdenticalTo:TIm thay");
 
    
    NSUInteger kq=[arrStudent indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        Student* stu=(Student*)obj;
        if([stu.fullName isEqualToString:@"Khanh Nguyen"]){
            return true;
        }else
            return false;
    }];
    if(kq!=NSNotFound)
        NSLog(@"indexOfObjectPassingTest: Tim thay tai index:%ld",kq);
    else
        NSLog(@"indexOfObjectPassingTest: Khong tim thay tai index:%ld",kq);
// ------Phan 2
    NSArray* dsCauThu=@[@" Petr Cech" ,
                            @"Ross Turnbull",
                            @"Henrique Hilario",
                            @" Jan Sebek" ,
                            @" Branislav Ivanovic" ,
                            @"Ashley Cole" ,
                            @"David Luiz Moreira Marinho",
                            @"Jose Bosingwa da Silva" ,
                            @"Paulo Renato Rebocho Ferreira" ,
                            @"John Terry",
                            @"Rodrigo Dias da Costa, Alex",
                            @" Sam Hutchinson" ,
                            @"Michael Essien" ,
                            @" Ramires Santos do Nascimento",
                            @"Frank Lampard" ,
                            @"Yossi Benayoun" ,
                            @"John Obi Mikel" ,
                            @"Florent Malouda" ,
                             ];
   NSArray*doituyen= [self getDoiTuyen:dsCauThu];
    for (int i=0; i<doituyen.count; i++) {
        NSLog(@"%@",doituyen[i]);
    }
}

-(NSArray*) getDoiTuyen:(NSArray*)dsCT{
    NSMutableArray* kq =  [NSMutableArray new];
    int lengthDSCT=(int)[dsCT count];

    for (int i=0; i<11; i++) {
    int index=arc4random_uniform(lengthDSCT);
        if (![kq containsObject:dsCT[index]]){
            [kq addObject:dsCT[index]];
        }else
            i--;
    }
    NSLog(@"SO luong cau thu %ld",[kq count]);
    return kq;
}
@end
