//
//  SapXepArray.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/3/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "SapXepArray.h"

@interface SapXepArray ()

@end

@implementation SapXepArray{
    int hang;
    int cot;
    int Mang[3][3],MPhu[3][3];
    int temp;
    char* arr[5];
    NSArray* Chuoi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Bai 1 ----------------------------------
    hang=3;
    cot=3;
    temp=0;
    printf("---------Cach 1!----------\n");

    for (int i=0; i<hang; i++) {
        for (int j=0; j<cot; j++) {
            Mang[i][j]=arc4random_uniform(99);
            MPhu[i][j]= Mang[i][j];
            printf("%2d ",Mang[i][j]);
        }
        printf("\n");
    }
    printf("---------Mang sau khi sap xep!----------\n");
    for (int i=0; i<hang; i++) {
        for (int j=0; j<cot; j++) {
        if(j!=cot-1){
            for (int k=i; k<hang; k++) {
                if(k==i){
                    for (int g=j+1; g<cot; g++) {
                        if(Mang[k][g]<=Mang[i][j]){
                            temp=Mang[i][j];
                            Mang[i][j]=Mang[k][g];
                            Mang[k][g]=temp;
                        }
                    }
                }else{
                    for (int g=0; g<cot; g++) {
                        if(Mang[k][g]<=Mang[i][j]){
                            temp=Mang[i][j];
                            Mang[i][j]=Mang[k][g];
                            Mang[k][g]=temp;
                        }
                    }
                    
                }
            }
        }else
            if(i!=cot-1){
                for (int k=i+1; k<hang; k++) {
                    for (int g=0; g<cot; g++) {
                        if(Mang[k][g]<=Mang[i][j]){
                            temp=Mang[i][j];
                            Mang[i][j]=Mang[k][g];
                            Mang[k][g]=temp;
                        }
                    }
                }
            }
        }
    }
    
    for (int i=0; i<hang; i++) {
        for (int j=0; j<cot; j++) {
            printf("%2d ",Mang[i][j]);
        }
        printf("\n");
    }
    
    //Cach 2 quick sort ----------------------------------
//    printf("---------Cach 2!----------\n");
    [self quickSortILeft:0 andJ1:0 andI2:hang-1 andJ2:cot-1];
//    for (int i=0; i<hang; i++) {
//        for (int j=0; j<cot; j++) {
//            printf("%2d ",MPhu[i][j]);
//        }
//        printf("\n");
//    }

   // Bai 2 ----------------------------------
//    *arr[5]={"khanh","DBanh","DDanh","Bhanh","Ahanh"};
    arr[0]="Kxanh";
    arr[1]="KIanh";
    arr[2]="KBanh";
    arr[3]="KhBnh";
    arr[4]="KhaAh";
    Chuoi=@[@"Khanh",@"KAAnh",@"KBanh",@"KAanh",@"Bhanh"];

   [self SapxepChuoiLeft:0 Right:4];
    for (int i=0; i<5; i++) {
        printf("%s\n",(char*)arr[i]);
    }
}
-(void) SapxepChuoiLeft:(int)left Right:(int)right{
    int giua=(left+right)/2;
    int i=left ;
    int j=right;
    BOOL kq=true;
    char* temp;
    do{
        while (kq) {
            for (int x=0; x<=4; x++) {
                if(tolower(*(arr[i]+x))>tolower(*(arr[giua]+x))){
                    kq=false;
                    break;
                }
            }
            i++;
            if (i>j) {
                break;
            }
        }
        kq=true;
        while (kq) {
            for (int x=0; x<=4; x++) {
                if(tolower(*(arr[j]+x))<tolower(*(arr[giua]+x))){
                    kq=false;
                    break;
                }
            }
            j--;
            if (i>j) {
                break;
            }
        }
        printf("Giua:%s\n",arr[giua]);
        for (int i=0; i<5; i++) {
            printf("%s\n",(char*)arr[i]);
        }
        if(i<=j){
            temp=arr[i];
            arr[i]=arr[j];
            arr[j]=temp;
        }
    }while (i<j);
    if(left<j)
        [self SapxepChuoiLeft:left Right:j];
    if (right>i) {
        [self SapxepChuoiLeft:i Right:right];
    }
}
-(void)quickSortILeft:(int)i1Left andJ1:(int)j1Left andI2:(int)i2Right andJ2:(int)j2Right{
    int gtGiua= ((i1Left*cot+j1Left)+(i2Right*cot+j2Right))/2;
    int IGiua=gtGiua/cot;
    int JGiua=gtGiua%cot;
    int Giua= MPhu[IGiua][JGiua];
//     printf("Lan thu:%d\n",Giua);
    int i1=i1Left;
    int j1=j1Left;
    int i2=i2Right;
    int j2=j2Right;
    do{
        while (MPhu[i1][j1]<Giua) {
            j1++;
            if (j1==cot) {
                j1=0;
                i1++;
            }
        }
        while (MPhu[i2][j2]>Giua) {
            j2--;
            if (j2==-1){
                j2=cot-1;
                i2--;
            }
        }
        if(i1>=i2&&j1>j2){
            break;
        }else{
            temp=MPhu[i1][j1];
            MPhu[i1][j1]=MPhu[i2][j2];
            MPhu[i2][j2]=temp;
            if (j1!=cot-1)
                j1++;
            else{
                j1=0;
                i1++;
            }
            if (j2!=0)
                j2--;
            else{
                j2=cot-1;
                i2--;
            }
        }
    }while (i1<=i2);
    if (i1Left<=i2&&j1Left<=j2) {
        [self quickSortILeft:i1Left andJ1:j1Left andI2:i2 andJ2:j2];
    }
    if (i2Right>=i1&&j2Right>=j1) {
        [self quickSortILeft:i1  andJ1:j1 andI2:i2Right andJ2:j2Right];
    }
}
@end
