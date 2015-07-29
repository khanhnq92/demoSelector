//
//  ViewController.m
//  zigzac
//
//  Created by Huy Quang Ngo on 7/8/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "ZigzacController.h"

@interface ZigzacController ()

@end

@implementation ZigzacController

- (void)viewDidLoad {
    [super viewDidLoad];
    printf("----------------Cach 1------------------\n");
    printf("    +       +       +\n");
    printf("   + +     + +     +\n");
    printf("  +   +   +   +   +\n");
    printf(" +     + +     + +\n");
    printf("+       +       +\n");
    printf("----------------Cach 2------------------\n");
    int y=5;
    int x=21;
    for (int i=0; i<y; i++) {
        for (int j=1; j<=x; j++) {
            
            if(j==5-i||j==5+i||j==13-i||j==13+i||j==21-i){
                printf("+");
            }else{
                printf("-");
            }
        }
        printf("\n");
       
    }
     printf("----------------Cach 3------------------\n");
    y=6;
    x=11;
    int dinh=0;
    int dem=1;
    for (int i=0; i<y; i++) {
        for (int j=1; j<=x; j++) {
            if(j==y+dinh*(2*y-2)-i||j==y+dinh*(2*y-2)+i) {
                printf("+");
                if(i==0||i==y-1){
                        dinh+=1;
                }else{
                    if(dem%2==0){
                        dinh+=1;
                    }
                     dem++;
                }
                
            }else{
                printf("-");
            }
        }
        printf("\n");
        dem=1;
        dinh=0;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
