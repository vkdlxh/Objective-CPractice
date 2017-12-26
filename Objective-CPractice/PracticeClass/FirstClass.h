//
//  FirstClass.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstClass : NSObject {
    int         myFirstInt;
    NSString    *myName;
    NSString    *myScrect;
}

// Make getter, setter
@property (nonatomic, assign)   int         myFirstInt;
@property (nonatomic, retain)   NSString    *myName;

// Interface Methods
- (void) myFirstMethod;
- (void) setMyScrect:(NSString *)screct;
- (NSString *) getMyScrect;

// Class Method
+ (void) itIsClassMethod;

//  New Instance Methods
- (NSInteger) addTwoIntegersWithFirstInt:(NSInteger)firstInteger secondInt:(NSInteger)secondInteger;
- (NSString *) changeToUpperOrLowerCaseWithString:(NSString *)targetString isToUpperCase:(BOOL)isToUpperCase;
- (void) printFoo;

@end

