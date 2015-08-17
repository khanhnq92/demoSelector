//
//  ColorView.h
//  Selector
//
//  Created by Huy Quang Ngo on 8/17/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView : UIView
-(instancetype)initWithHex:(NSString*)hex
                     alpha:(float)alpha
                     frame:(CGRect)frame;
@property (nonatomic,strong) NSString* hex;
-(void)fadeOut;
@end
