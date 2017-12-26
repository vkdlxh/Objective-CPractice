//
//  FirstClass.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "FirstClass.h"

@implementation FirstClass

@synthesize myFirstInt, myName;

// 호출하면 로그를 날리는 메소드
- (void) myFirstMethod {
    NSLog(@"It is instance method");
}

// mySrect 인스턴스를 생성한다.
- (void) setMyScrect:(NSString *)screct {
    myScrect = [NSString stringWithString:screct];
}

// getter. mySrect 인스턴스를 반환.
- (NSString *) getMyScrect {
    return myScrect;
}

// 호출하면 로그를 날린다.
+ (void) itIsClassMethod {
    NSLog(@"It is class method. It works without alloc or init");
}

// 두 정수의 합을 반환하는 메소드
- (NSInteger) addTwoIntegersWithFirstInt:(NSInteger)firstInteger secondInt:(NSInteger)secondInteger {
    return firstInteger + secondInteger;
}

// 모든 문자열을 소문자 또는 대문자로 변환하여 반환하는 메소드
- (NSString *) changeToUpperOrLowerCaseWithString:(NSString *)targetString isToUpperCase:(BOOL)isToUpperCase {
    if ( isToUpperCase == YES ) {
        return [targetString uppercaseString];
    } else {
        return [targetString lowercaseString];
    }
}

- (void) printFoo {
    NSLog(@"Foo");
}

@end

