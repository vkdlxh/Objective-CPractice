//
//  main.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FirstClass.h"
#import "FirstChildClass.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 클래스 메소드는 초기화 하지 않고 메소드를 호출 할 수 있다.
        [FirstClass itIsClassMethod];
        
        // FirstClass의 인스턴스를 생성하고 초기화한다.
        FirstClass *instance = [[FirstClass alloc] init];
        
        // 인스턴스의 인스턴스 변수인 myName을 세팅.
        [instance setMyName:@"jsj"];
        
        // 세팅된 myName을 name이라는 새로운 인스턴스에 넣는다.
        NSString *name = [instance myName];
        NSLog(@"My name is %@.", name);
        
        // myScrect 사용
        [instance setMyScrect:@"It's top screct!"];
        NSLog(@"my screct is %@.", [instance getMyScrect]);
        
        // myFirstInt 세팅 [instance setMyFirstInt : 88]; 과 같음.
        instance.myFirstInt = 88;
        NSLog(@"myFirstInt : %d", [instance myFirstInt]);
        
        // 프로퍼티의 값을 바꿀 수 있다.
        instance.myName = @"new Name";
        [instance setMyFirstInt:77];
        
        NSLog(@"My New Name is %@.", [instance myName]);
        NSLog(@"My New MyFirstInt is %d", [instance myFirstInt]);
        
        
        NSInteger firstInteger = 300;
        NSInteger secondInteger = 200;
        NSInteger resultInteger = 0;
        
        resultInteger = [instance addTwoIntegersWithFirstInt:firstInteger secondInt:secondInteger];
        
        NSLog(@"resultInteger : %ld (%ld + %ld)", resultInteger, firstInteger, secondInteger);
        
        firstInteger = 150;
        secondInteger = -200;
        
        resultInteger = [instance addTwoIntegersWithFirstInt:firstInteger secondInt:secondInteger];
        
        NSLog(@"resultInteger : %ld (%ld + %ld)", resultInteger, firstInteger, secondInteger);
        
        NSString *nameString = @"Hello, I'm SangJun.";
        NSString *resultString = NULL;
        
        
        resultString = [instance changeToUpperOrLowerCaseWithString:nameString isToUpperCase:YES];
        
        NSLog(@"resultString : %@", resultString);
        
        resultString = [instance changeToUpperOrLowerCaseWithString:nameString isToUpperCase:NO];
        
        NSLog(@"resultString : %@", resultString);
        
        
        // 자식클래스는 부모 클래스를 그대로 이어받는다.
        FirstChildClass *childClass = [[FirstChildClass alloc] init];
        
        [childClass setMyName:@"My Name is childClass."];
        NSLog(@"%@", [childClass myName]);
        
        
        // 오버라이딩
        [FirstChildClass itIsClassMethod];
        // 부모클래스의 메소드
        [[childClass superclass] itIsClassMethod];
        
        [childClass getMyScrect];
        
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
