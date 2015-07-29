//
//  Student.h
//  Selector
//
//  Created by Huy Quang Ngo on 7/29/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(nonatomic,strong) NSString* fullName;
@property(nonatomic,strong) NSString* studentID;
-(instancetype) init:(NSString*)fullName andID:(NSString*)studentID;
-(void)sayYourName;
@end
