//
//  Group.h
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/27.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic, assign) NSInteger groupId;
@property (nonatomic, strong) NSString *name;

- (id) initGroup:(NSDictionary *)dict;

@end
