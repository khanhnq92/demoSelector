//
//  Student.m
//  Selector
//
//  Created by Huy Quang Ngo on 7/29/15.
//  Copyright (c) 2015 Khanh. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)sayYourName{
    NSLog(@"Hello %@!",_fullName);
}
- (instancetype)init:(NSString *)fullName andID:(NSString *)studentID
{
    self = [super init];
    if (self) {
        _fullName=fullName;
        _studentID=studentID;
    }
    return self;
}
- (BOOL)isEqual:(id)other
{
    if ([other isMemberOfClass:[self class]]) {
        Student* stu=(Student*)other;
        if (stu.studentID==_studentID&&stu.fullName==_fullName) {
            return true;
        }else
            return false;
    } else
        return false;
}
@end
