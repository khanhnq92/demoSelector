//
//  UIColor+color.m
//  Selector
//
//  Created by Huy Quang Ngo on 8/17/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "UIColor+color.h"

@implementation UIColor (color)
-(instancetype)initWithHex:(NSString*)hex
                     alpha:(float)alpha{
    CGFloat alphaValue=1;
    if(alpha>=0 && alpha<=1)
        alphaValue=alpha;
    
    NSString* validHexChars=@"abcdefABCDEF0123456789";
    NSMutableString* filterHex=[[NSMutableString alloc] initWithCapacity:6];
    for (int i=0; i<hex.length; i++) {
        unichar charInput= [hex characterAtIndex:i];
        NSString* hexChar=[NSString stringWithFormat:@"%c",charInput];
        if([validHexChars rangeOfString:hexChar options:NSCaseInsensitiveSearch].location!=NSNotFound){
            [filterHex appendString:hexChar];
        }
    }
    if (filterHex.length==6) {
        unsigned long long colorValue=0;
        NSScanner *scanner=[[NSScanner alloc] initWithString:filterHex];
        [scanner scanHexLongLong:&colorValue];
        CGFloat red=(CGFloat) ((colorValue & 0xFF0000)>>16)/255.0;
        CGFloat green=(CGFloat) ((colorValue & 0x00FF00)>>8)/255.0;
        CGFloat blue=(CGFloat) (colorValue & 0x0000FF)/255.0;
        return [self initWithRed:red
                           green:green
                            blue:blue
                           alpha:alpha];
    }
    return [self initWithRed:0
                       green:0
                        blue:0
                       alpha:alpha];
}

@end
