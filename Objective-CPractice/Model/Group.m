//
//  Group.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/27.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "Group.h"

@implementation Group

@synthesize groupId;
@synthesize name;

- (id)initGroup:(NSDictionary *)dict {
    
    self = [super init];
    
    if(self) {
        NSInteger groupId = [[dict valueForKey:@"id"] intValue];
        NSString *name = [dict valueForKey:@"name"];
        
        self.groupId = groupId;
        self.name = name;
    }
    
    return self;
}

@end
