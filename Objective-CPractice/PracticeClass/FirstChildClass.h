//
//  FirstChildClass.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "FirstClass.h"

@interface FirstChildClass: FirstClass

- (void) getMyScrect;   // 부모클래스 FirstClass의 getMyScrect이라는 인스턴스 클래스를 재정의(오버라이딩) 할 수 있다.

+ (void) itIsClassMethod;   // 클래스메소드도 재정의 가능.

@end
