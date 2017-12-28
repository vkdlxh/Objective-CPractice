//
//  User.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userId;
@synthesize name;
@synthesize profile_image_url;

- (id) initUser:(NSDictionary *)user {
    self = [super init];
    
    if(self) {
        NSInteger userId = [[user valueForKey:@"id"] intValue];
        NSString *name = [user valueForKey:@"name"];
        NSString *profile_image_url = [user valueForKey:@"profile_image_url"];
        
        self.userId = userId;
        self.name = name;
        self.profile_image_url = profile_image_url;
    }
    
    return self;
}

@end
