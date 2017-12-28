//
//  Team.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/26.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "Team.h"

@implementation Team

@synthesize domain;
@synthesize name;

- (id) initTeam:(NSDictionary *)team {
    self = [super init];
    
    if(self) {
        NSString *domain = [team valueForKey:@"domain"];
        NSString *name = [team valueForKey:@"name"];
        
        self.domain = domain;
        self.name = name;
    }
    
    return self;
}

@end
