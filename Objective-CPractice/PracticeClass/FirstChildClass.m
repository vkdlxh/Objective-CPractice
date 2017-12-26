//
//  FirstChildClass.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "FirstChildClass.h"

@implementation FirstChildClass

- (void) getMyScrect {
    NSLog(@"getMyScrect method was overrided by child Class.");
}

+ (void) itIsClassMethod {
    NSLog(@"itIsClassMethod method was overrided by child Class.");
}

@end
