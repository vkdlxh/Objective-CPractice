//
//  Group.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/27.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "Group.h"

@implementation Group

- (id)initGroup:(NSDictionary *)group {
    
    self = [super init];
    
    if(self) {
        NSInteger groupId = [[group valueForKey:@"id"] intValue];
        NSString *name = [group valueForKey:@"name"];
        
        self.groupId = groupId;
        self.name = name;
    }
    
    return self;
}

@end
