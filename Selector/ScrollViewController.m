//
//  ScrollViewController.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/28/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 20;
}

@end
