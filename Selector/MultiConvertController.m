

#import "MultiConvertController.h"

@interface MultiConvertController ()
@property (weak, nonatomic) IBOutlet UIView *vHienThi;
@end

@implementation MultiConvertController{
    BOOL isShow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isShow=true;

}
- (IBAction)doSwitch:(id)sender {
    if (isShow) {
        _vHienThi.hidden=YES;
        isShow=!isShow;
    }else{
        _vHienThi.hidden=NO;
        isShow=!isShow;
    }
}
- (IBAction)doAlpha:(id)sender {
    UISlider* slider=(UISlider*)sender;
    _vHienThi.alpha=slider.value;
}
- (IBAction)doRolate:(UISlider*)sender {
    CGAffineTransform rotation = CGAffineTransformMakeRotation(sender.value*M_PI);
    
     CGAffineTransform scale =CGAffineTransformMakeScale(sender.value*2, sender.value*2);
    _vHienThi.transform=CGAffineTransformConcat(rotation, scale);
}

- (IBAction)doColor:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex) {
        case 1:
            _vHienThi.backgroundColor=[UIColor redColor];
            break;
        case 2:
            _vHienThi.backgroundColor=[UIColor blueColor];
            break;
        case 3:
            _vHienThi.backgroundColor=[UIColor yellowColor];
            break;
        case 4:
            _vHienThi.backgroundColor=[UIColor blackColor];
            break;
            
        default:
            break;
    }
}

@end
