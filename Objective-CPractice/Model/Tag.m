//
//  Tag.m
//  Objective-CPractice
//
//  Created by jeonsangjun on 2017/12/28.
//  Copyright © 2017年 jeonsangjun. All rights reserved.
//

#import "Tag.h"

@implementation Tag

- (id)initTag:(NSDictionary *)tag {
    self = [super init];
    
    if(self) {
        NSString *name = [tag valueForKey:@"name"];

        self.name = name;
    }
    
    return self;
}

@end
