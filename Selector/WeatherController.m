//
//  ViewController.m
//  weather
//
//  Created by ios31 on 7/2/15.
//  Copyright (c) 2015 ios31. All rights reserved.
//

#import "WeatherController.h"

@interface WeatherController ()
@property (weak, nonatomic) IBOutlet UILabel *lbltem;
@property (weak, nonatomic) IBOutlet UIButton *btnNhietDo;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@property (weak, nonatomic) IBOutlet UIImageView *images;
- (IBAction)btnUpdate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblDo;

@end

@implementation WeatherController{
    NSArray * locations;
    NSArray * arrImage;
    NSArray * content;
    bool check;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    check=false;
    locations=@[@"Hà Nam, Việt Nam",@"TP Hồ Chí Minh, Việt Nam",@"New York, USA",@"Đà Nẵng, Việt Nam"];
    arrImage=@[@"ico_rain",@"ico_sun",@"ico_warm",@"ico_update"];
    content=@[@"Hà Nam, Hà Nam, Hà Nam, Hà Nam, Hà Nam,",@"Hồ Chí Minh, Hồ Chí Minh,Hồ Chí Minh,",@"New York, New York, New York, New York",@"Đà Nẵng, Đà Nẵng, Đà Nẵng, Đà Nẵng"];
}
- (IBAction)doNhietdo:(id)sender {
    if(!check)
        _lblDo.text=@"F";
    else
        _lblDo.text=@"C";
    check=!check;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnUpdate:(id)sender {
    int index=arc4random_uniform((int)locations.count);
    _lbltem.text=locations[index];
    
    _lblContent.text=content[index];
    
    _images.image=[UIImage imageNamed:arrImage[index]];
    
    [_btnNhietDo setTitle:[NSString stringWithFormat:@"%2.1f",[self getNhietDo]] forState:UIControlStateNormal];
}
-(float) getNhietDo{
    return 14+arc4random_uniform(18)+(float)arc4random()/(float)INT32_MAX;
}
@end
